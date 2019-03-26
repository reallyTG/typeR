library(ssh.utils)


### Name: run.remote
### Title: Functions to run commands remotely via 'ssh' and capture output.
### Aliases: run.remote run.withwarn

### ** Examples

## Not run: 
##D ## Error handling:
##D remote = ""
##D command = "ls /abcde"
##D res <- run.remote(cmd=command, remote=remote)
##D if (res$cmd.error)
##D {
##D    stop(paste(paste(res$cmd.out, collapse="\n"), res$warn.msg, sep="\n"))
##D }
##D # Error: ls: /abcde: No such file or directory
##D # running command 'ls /abcde  2>&1 ' had status 1
##D 
##D ## Fetching result of a command on a remote server
##D 
##D # Get the file size in bytes
##D res <- run.remote("ls -la myfile.csv | awk '{print \\$5;}'", remote = "me@myserver")
##D res
##D # $cmd.error
##D # [1] FALSE
##D #
##D # $cmd.out
##D # [1] "42"
##D # attr(,"num.warnings")
##D # [1] 0
##D # attr(,"elapsed.time")
##D # elapsed
##D # 1.063
##D #
##D # $warn.msg
##D # NULL
##D 
##D file.length <- as.integer(res$cmd.out)
## End(Not run)



