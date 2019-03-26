library(bulletr)


### Name: unfortify_x3p
### Title: Convert a data frame into an x3p file
### Aliases: unfortify_x3p

### ** Examples

data(br411)
br411_fort <- fortify_x3p(br411)
br411_unfort <- unfortify_x3p(br411_fort)
identical(br411_unfort, br411)



