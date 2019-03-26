library(rportfolios)


### Name: segment.complement
### Title: Complement of Investment Segments
### Aliases: segment.complement
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
    segment.complement( 10, I )
    segment.complement( 10, NULL )
    segment.complement( 10, I[[1]] )
    segment.complement( 10, I[[2]] )
    segment.complement( 10, I[[3]] )
    segment.complement( 10, I[[4]] )



