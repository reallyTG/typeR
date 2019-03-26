library(learningCurve)


### Name: ca_block
### Title: Wright's Cumulative Average Learning Curve Function
### Aliases: ca_block

### ** Examples

# Production of the first 200 units of a product is nearing its
# end. Your customer said he is willing to buy an additional 50
# units. There will be no break in production or in learning. The
# first unit required 75 hours and the first 200 units had an 85%
# learning curve. How many hours will the second block of 50 units
# require?

ca_block(t = 75, m = 201, n = 250, r = .85)
## [1] 806.772




