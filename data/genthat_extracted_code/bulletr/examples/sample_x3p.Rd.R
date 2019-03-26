library(bulletr)


### Name: sample_x3p
### Title: Sample every X element of a data frame
### Aliases: sample_x3p

### ** Examples

data(br411)
br411_fort <- fortify_x3p(br411)
br411_sample <- sample_x3p(br411_fort, byxy = c(4, 4))
head(br411_sample)



