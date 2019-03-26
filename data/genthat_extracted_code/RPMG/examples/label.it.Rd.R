library(RPMG)


### Name: label.it
### Title: Labels on Plots
### Aliases: label.it
### Keywords: aplot

### ** Examples


par(mfrow=c(2,2))
for(i in 1:4)
{
plot(rnorm(5), rnorm(5))
label.it(letters[i],1)
}




