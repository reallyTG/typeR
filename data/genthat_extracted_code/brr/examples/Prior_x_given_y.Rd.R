library(brr)


### Name: Prior_x_given_y
### Title: Prior predictive distribution of the count x in the treated
###   group conditionally to the count y in the treated group
### Aliases: Prior_x_given_y dprior_x_given_y pprior_x_given_y
###   qprior_x_given_y rprior_x_given_y sprior_x_given_y

### ** Examples

barplot(dprior_x_given_y(0:10, 5, 3, 10, 20))
sprior_x_given_y(5, 3, 10, 20, output="pandoc")



