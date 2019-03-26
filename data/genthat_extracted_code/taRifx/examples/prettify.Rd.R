library(taRifx)


### Name: prettify
### Title: Function to prettify the output of another function using a
###   'var.labels' attribute This is particularly useful in combination
###   with read.dta et al.
### Aliases: prettify

### ** Examples

testDF <- data.frame( a=seq(10),b=runif(10),c=rnorm(10) )
attr(testDF,"var.labels") <- c("Identifier","Important Data","Lies, Damn Lies, Statistics")
prettify( testDF, quote(str(dat)) )



