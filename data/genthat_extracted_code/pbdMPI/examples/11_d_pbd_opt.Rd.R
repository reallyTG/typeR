library(pbdMPI)


### Name: Set global pbd options
### Title: Set Global pbdR Options
### Aliases: pbd_opt
### Keywords: global variables

### ** Examples

## Not run: 
##D ### Save code in a file "demo.r" and run with 4 processors by
##D ### SHELL> mpiexec -np 4 Rscript demo.r
##D 
##D ### Initial.
##D suppressMessages(library(pbdMPI, quietly = TRUE))
##D init()
##D 
##D ### Examples.
##D ls(.pbd_env)
##D pbd_opt(ICTXT = c(2, 2))
##D pbd_opt(bytext = "grid.new <- list(); grid.new$ICTXT <- c(4, 4)")
##D pbd_opt(BLDIM = c(16, 16), bytext = "grid.new$BLDIM = c(8, 8)")
##D ls(.pbd_env)
##D .pbd_env$ICTXT
##D .pbd_env$BLDIM
##D .pbd_env$grid.new
##D 
##D ### Finish.
##D finalize()
## End(Not run)



