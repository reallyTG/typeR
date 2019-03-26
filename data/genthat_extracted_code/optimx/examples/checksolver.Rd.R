library(optimx)


### Name: checksolver
### Title: Test if requested solver is present
### Aliases: checksolver
### Keywords: nonlinear optimize

### ** Examples

   allmeth <- c("Rvmmin", "nlminb","ipopttest")
   allpkg <- c("Rvmmin", "stats","ipoptr")
   
   print(checksolver("nlminb", allmeth, allpkg))
   # If Rvmmin NOT available, get msg that PACKAGE not available.
   print(checksolver("Rvmmin", allmeth, allpkg))
   # Get message that SOLVER not found
   print(checksolver("notasolver", allmeth, allpkg))




