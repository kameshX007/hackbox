FROM kasmweb/core-ubuntu-jammy:1.11.0
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME
######### Customize Container Here ###########

RUN apt update
RUN apt -y upgrade
RUN apt -y install neofetch htop
RUN apt -y autoremove

######### End Customizations ###########
RUN chown 1001:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1001:0 $HOME
