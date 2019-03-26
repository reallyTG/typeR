library(ssh)


### Name: ssh_exec
### Title: Execute Remote Command
### Aliases: ssh_exec ssh_exec_wait ssh_exec_internal

### ** Examples

## Not run: 
##D session <- ssh_connect("dev.opencpu.org")
##D ssh_exec_wait(session, command = c(
##D   'curl -O https://cran.r-project.org/src/contrib/jsonlite_1.5.tar.gz',
##D   'R CMD check jsonlite_1.5.tar.gz',
##D   'rm -f jsonlite_1.5.tar.gz'
##D ))
## End(Not run)



