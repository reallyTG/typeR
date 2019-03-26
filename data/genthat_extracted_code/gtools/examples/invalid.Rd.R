library(gtools)


### Name: invalid
### Title: Test if a value is missing, empty, or contains only NA or NULL
###   values
### Aliases: invalid
### Keywords: programming

### ** Examples


invalid(NA)
invalid()
invalid(c(NA,NA,NULL,NA))

invalid(list(a=1,b=NULL))

# example use in a function
myplot <- function(x,y) {
                if(invalid(y)) {
                        y <- x
                        x <- 1:length(y)
                }
                plot(x,y)
        }
myplot(1:10)
myplot(1:10,NA)



