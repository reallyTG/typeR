library(compositions)


### Name: gsifiltercall
### Title: Calling from a function with the own parameters
### Aliases: gsi.filtercall
### Keywords: internal

### ** Examples

#	fxy <- function(x,y) x+y
#	fxz <- function(x,z) x*z
#	fxyz <- function(...) {
#	   list(gsi.filtercall("fxy"),gsi.filtercall("fxz"))
#        }	 
#	fxyz(x=1,y=2,z=7)
#	fxyz(x=1,fxz.x=2,y=10,z=55)



