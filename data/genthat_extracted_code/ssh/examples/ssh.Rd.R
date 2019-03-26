library(ssh)


### Name: ssh_connect
### Title: SSH Client
### Aliases: ssh_connect ssh ssh_info ssh_disconnect libssh_version

### ** Examples

## Not run: 
##D session <- ssh_connect("dev.opencpu.org")
##D ssh_exec_wait(session, command = "whoami")
##D ssh_disconnect(session)
## End(Not run)



