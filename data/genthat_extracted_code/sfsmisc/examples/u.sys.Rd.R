library(sfsmisc)


### Name: u.sys
### Title: 'Portable' System function (R / S-plus)
### Aliases: u.sys Sys.ps.cmd
### Keywords: utilities environment

### ** Examples

u.sys # shows how simply the function is defined :
## Not run: 
##D   function (..., intern = TRUE)
##D   system(paste(..., sep = ""), intern = intern)
## End(Not run)

# All *running* processes of user [sometimes only R]:
try ( u.sys(Sys.ps.cmd(), "ur") )



