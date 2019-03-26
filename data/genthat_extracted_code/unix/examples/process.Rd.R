library(unix)


### Name: getuid
### Title: Process Info
### Aliases: getuid getgid geteuid getegid getpid getppid getpgid
###   getpriority setuid seteuid setgid setegid setpgid setpriority kill

### ** Examples

# Current User:
getuid()
# Current UserGroup:
getgid()
# Current UserGroup:
geteuid()
# Current UserGroup:
getegid()
# Process ID
getpid()
# parent PID:
getppid()
# Process group id:
getpgid()

# Detach process group
setpgid(0)
getpgid()
# Process priority:
getpriority()
# Decrease priority
setpriority(getpriority() + 1)



