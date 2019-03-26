library(rportfolios)


### Name: underweight.segments
### Title: Underweight Active Investment Segment Exposures
### Aliases: underweight.segments
### Keywords: math

### ** Examples

onePortfolio <- random.longonly( 10 )
I <- list()
I[[1]] <- c( 1, 2, 3 )
I[[2]] <- c( 4, 5 )
I[[3]] <- c( 6, 7 )
I[[4]] <- c( 8, 9, 10 )
underweight.segments( onePortfolio, I[[1]], 0 )
underweight.segments( onePortfolio, I[[1]], .1 )



