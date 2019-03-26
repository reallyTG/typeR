library(AnnuityRIR)


### Name: plot_FVs_post
### Title: Plot the final expected values of an n-payment annuity, with
###   payments of 1 unit each made at the end of every year
###   (annuity-immediate), valued at the rate X, using different
###   approaches.
### Aliases: plot_FVs_post

### ** Examples

#example 1
data = c(1.77,1.85,1.85,1.84,1.84,1.83,1.85,1.85,1.88,1.85,1.80,1.84,1.91,1.85,1.84,1.85,
1.86,1.85,1.88,1.86)
data=data/100
plot_FVs_post(data)

# example 2
data<-rnorm(n=30,m=0.03,sd=0.003)
plot_FVs_post(data)



