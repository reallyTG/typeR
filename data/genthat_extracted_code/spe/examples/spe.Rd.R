library(spe)


### Name: spe
### Title: Implements the stochastic proximity embedding algorithm
### Aliases: spe
### Keywords: nonparametric

### ** Examples

## load the phone dataset
data(phone)

## run SPE, embed$stress should be 0 or very close to it
## You can plot the embedding using the scatterplot3d package
## (This will take a few minutes to run)
embed <- spe(phone, edim=3, evalstress=TRUE)

## evaluate the Sammon stress
stress <- eval.stress(embed$x, phone)

## embed the Swiss Roll dataset in 2D
data(swissroll)
embed <- spe(swissroll, edim=2, evalstress=TRUE)



