library(makeFlow)


### Name: addAlpha
### Title: addAlpha()
### Aliases: addAlpha

### ** Examples


## The function is currently defined as
function (col, alpha = 1) 
{
    if (missing(col)) 
        stop("Please provide a vector of colors.")
    apply(sapply(col, col2rgb)/255, 2, function(x) {
        rgb(x[1], x[2], x[3], alpha = alpha)
    })
  }



