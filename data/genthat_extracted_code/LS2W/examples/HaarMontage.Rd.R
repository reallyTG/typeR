library(LS2W)


### Name: HaarMontage
### Title: Generate a 2-D Haar MA process.
### Aliases: HaarMontage
### Keywords: models

### ** Examples

# Generate a realisation of the non-stationary combined Haar MA
# process with structure in the vertical direction. 
MyHaar2 <- HaarMontage(128,direction="diagonal",sd=1) 
# Plot it.
#
 image(MyHaar2)



