library(nlirms)


### Name: rmspsc
### Title: Rate-making system based on the posteriori severity component
### Aliases: rmspsc rmspsc

### ** Examples

# rate-making system based on the Exponential-Gamma model for severity component
rmspsc(time=5, claim=5, sumsev=100, smu = 50, ssigma = 3, snu = 2, family
="EGA", round=2, size=8 , padlength=4, padwidth=2)

# rate-making system based on the Exponential-Inverse Gamma model for severity component
rmspsc(time=5, claim=5, sumsev=100, smu = 50, ssigma = 3, snu = 2, family
="EIGA", round=2, size=8 , padlength=4, padwidth=2)

# rate-making system based on the Exponential-Generalized Inverse Gaussian model for severity
rmspsc(time=5, claim=5, sumsev=100, smu = 50, ssigma = 3, snu = 2, family
="EGIG", round=2, size=8 , padlength=4, padwidth=2)



