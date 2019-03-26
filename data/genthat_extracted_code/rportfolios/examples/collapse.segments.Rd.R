library(rportfolios)


### Name: collapse.segments
### Title: Collapse a list or vectors of portfolio segments
### Aliases: collapse.segments
### Keywords: math

### ** Examples

###
### define the segments
###
    I <- list()
    I[[1]] <- c( 1, 2, 3 )
    I[[2]] <- c( 4, 5 )
    I[[3]] <- c( 6, 7 )
    I[[4]] <- c( 8, 9, 10 )
    collapse.segments( I )
    collapse.segments( I[[1]] )
    collapse.segments( I[[2]] )
    collapse.segments( I[[3]] )
    collapse.segments( I[[4]] )



