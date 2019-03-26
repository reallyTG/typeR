library(cwhmisc)


### Name: is.constant
### Title: is.constant
### Aliases: is.constant
### Keywords: logic

### ** Examples

 is.constant(rep(c(sin(pi/2),1),10)) # TRUE
 x <- factor(c(1,1,NA))
 is.constant(x)            # FALSE because of NA
 is.constant(x[1:2])       # TRUE
 is.constant(c(1,1,NA))    # FALSE because of NA
 is.constant(c(1,1,2))     # FALSE
 is.constant(c(1,1,1))     # TRUE



