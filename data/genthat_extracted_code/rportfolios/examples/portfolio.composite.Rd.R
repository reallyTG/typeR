library(rportfolios)


### Name: portfolio.composite
### Title: Merge portfolios into a composite
### Aliases: portfolio.composite
### Keywords: math

### ** Examples

segments <- list()
segments[[1]] <- c( 1, 2, 3 )
segments[[2]] <- c( 4, 5 )
segments[[3]] <- c( 6, 7 )
segments[[4]] <- c( 8, 9, 10 )
weights <- c( .3, .2, .2, .3 )
vectors <- list()
matrices <- list()
for ( i in 1:4 ) {
vectors[[i]] <- random.longonly( 10, segments=segments[[i]] )
matrices[[i]] <- rlongonly( 200, 10, segments=segments[[i]] )
}
combined.vectors <- portfolio.composite( vectors, weights )
combined.matrices <- portfolio.composite( matrices, weights )



