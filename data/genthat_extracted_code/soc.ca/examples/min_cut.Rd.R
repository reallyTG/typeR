library(soc.ca)


### Name: min_cut
### Title: Cut a continuous variable into categories with a specified
###   minimum
### Aliases: min_cut

### ** Examples

a <- 1:1000
table(min_cut(a))
b <- c(rep(0, 50), 1:500)
table(min_cut(b, min.size = 20))




