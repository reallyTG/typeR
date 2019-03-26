library(loa)


### Name: 4.5.plot.argument.handlers
### Title: Common plot argument handlers
### Aliases: 4.5.plot.argument.handlers cexHandler colHandler
###   colRegionsHandler pchHandler scalesHandler zHandler
### Keywords: methods

### ** Examples


#some trivial data
a <- 1:10


##  Example 1
##  Simple plot with cex handling

myplot1 <- function(x, y, z = NULL, cex = NULL, 
                    cex.range = NULL, ...){

    #set cex
    cex <- cexHandler(z, cex, cex.range)

    #plot
    xyplot(y~x, cex = cex,...)
}

myplot1(a, a, a)

#  compare
## Not run: 
##D  
##D   myplot1(a, a)             #like plot(x, y)    
##D   myplot1(a, a, a*100)      #as myplot1(a, a, a)
##D                             #because cex scaled by range
##D   myplot1(a, b, c, 
##D       cex.range = c(1,5))   #cex range reset
##D   myplot1(a, b, c, 
##D       cex.range = c(10,50), 
##D       cex = 1)              #cex supersedes all else if supplied
## End(Not run)


## Example2
## plot function using lists/listUpdates

myplot2 <- function(x, y, z = NULL, ...){

    #my default plot
    default.args <- list(x = y~x, z = z, 
                         pch = 20, cex = 4)

    #update with whatever user supplied
    plot.args <- listUpdate(default.args, list(...))

    #col Management
    plot.args$col <- do.call(colHandler, plot.args)
    do.call(xyplot, plot.args)
}


#with colorkey based on z case
myplot2(a, a, a) 

#  compare 
## Not run: 
##D    myplot2(a, b, c, 
##D        col.regions = "Blues") #col.regions recoloring  
##D    myplot2(a, b, c, 
##D        col = "red")           ##but (again) col supersedes if supplied
## End(Not run)

#  Note:
#  See also example in ?listUpdate




