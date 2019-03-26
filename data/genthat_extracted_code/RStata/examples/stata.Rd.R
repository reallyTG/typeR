library(RStata)


### Name: stata
### Title: Send commands to a Stata process
### Aliases: stata

### ** Examples

## Not run: 
##D ## Single command
##D stata("help regress") #<- this won't work in Windows dued to needed
##D                       #   batch mode
##D 
##D ## Many commands
##D stata_src <- '
##D 
##D version 10
##D set more off
##D sysuse auto
##D reg mpg weight
##D 
##D '
##D stata(stata_src)
##D 
##D ## External .do file
##D stata("foo.do")
##D 
##D ## Data input to Stata
##D x <- data.frame(a = rnorm(3), b = letters[1:3])
##D stata( "sum a", data.in = x)
##D 
##D ## Data output from Stata (eg obtain 'auto' dataset)
##D auto <- stata("sysuse auto", data.out = TRUE)
##D head(auto)
##D 
##D ## Data input/output
##D (y <- stata("replace a = 2", data.in = x, data.out = TRUE))
## End(Not run)



