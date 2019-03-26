library(rportfolios)


### Name: set.segments
### Title: Set segment weights from portfolios
### Aliases: set.segments
### Keywords: math

### ** Examples

###
### simulate 300 long only portfolios with 30 investments
###
portfolios <- rlongonly( 300, 30 )
###
### define six segments with five investments in each
###
segment1 <- 1:5
segment2 <- 11:15
segment3 <- 21:25
segment4 <- 31:35
segment5 <- 41:45
segment6 <- 51:55
segments <- list( segment1, segment2, segment3, segment4, segment5, segment6 )
newPortfolios <- set.segments( portfolios, 60, segments )



