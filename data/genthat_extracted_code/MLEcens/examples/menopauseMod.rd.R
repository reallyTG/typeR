library(MLEcens)


### Name: menopauseMod
### Title: Modified menopause data
### Aliases: menopauseMod
### Keywords: datasets

### ** Examples

# Load the data
data(menopauseMod)

# Compute the MLE
mle <- computeMLE(menopauseMod)

# Create density plot
par(mfrow=c(1,1))
plotDens2(mle, xlim=c(0,100), border="black", xlab="age in years", 
 ylab="cause of menopause (1=operative, 2=natural)", 
 main="Density plot of the MLE for the menopause data")



