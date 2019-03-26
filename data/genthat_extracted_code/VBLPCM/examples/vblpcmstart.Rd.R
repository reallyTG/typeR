library(VBLPCM)


### Name: vblpcmstart
### Title: Generate sensible starting configuration for the variational
###   parameter set.
### Aliases: vblpcmstart

### ** Examples

data(sampson)
### plot the mean posterior positions with initial estimations for variational parameters
plot(vblpcmstart(samplike,G=3),main="Sampson's Monks: VB Initial Values")
### plot the mean posterior positions with final estimations for variational parameters
plot(vblpcmfit(vblpcmstart(samplike,G=3)),main="Sampson's Monks: VB Solution")



