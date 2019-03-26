library(Hmisc)


### Name: format.df
### Title: Format a Data Frame or Matrix for LaTeX or HTML
### Aliases: format.df
### Keywords: utilities interface methods file character manip

### ** Examples

## Not run: 
##D x <- data.frame(a=1:2, b=3:4)
##D x$m <- 10000*matrix(5:8,nrow=2)
##D names(x)
##D dim(x)
##D x
##D format.df(x, big.mark=",")
##D dim(format.df(x))
## End(Not run)



