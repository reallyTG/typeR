library(optigrab)


### Name: opt_get_args
### Title: Return arguments to Rscript
### Aliases: opt_get_args

### ** Examples

  opt_get_args()
  opt_get_args( opts=c( "Rscript", "-a", "-b", "--args", "-c", 3, "-d" ) )  # "-c" "3" "-d"
  opt_get_args( opts=c( "-a", "-b", "--args", "-c", "--args", "-d" ) )  # "-c" "-d"
  opt_get_args( opts=c( "--foo", "bar") ) 
  



