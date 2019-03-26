library(ssh)


### Name: scp
### Title: SCP (Secure Copy)
### Aliases: scp scp_download scp_upload

### ** Examples

## Not run: 
##D # recursively upload files and directories
##D session <- ssh_connect("dev.opencpu.org")
##D files <- c(R.home("doc"), R.home("COPYING"))
##D scp_upload(session, files, to = "~/target")
##D 
##D # download it back
##D scp_download(session, "~/target/*", to = tempdir())
##D 
##D # delete it from the server
##D ssh_exec_wait(session, command = "rm -Rf ~/target")
## End(Not run)



