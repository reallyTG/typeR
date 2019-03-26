library(ltm)


### Name: margins
### Title: Fit of the model on the margins
### Aliases: margins margins.gpcm margins.grm margins.ltm margins.rasch
###   margins.tpm
### Keywords: methods

### ** Examples


## Two- and Three-way residuals for the Rasch model
fit <- rasch(LSAT)
margins(fit)
margins(fit, "three")


## Two- and Three-way residuals for the one-factor model
fit <- ltm(WIRS ~ z1)
margins(fit)
margins(fit, "three")


## Two- and Three-way residuals for the graded response model
fit <- grm(Science[c(1,3,4,7)])
margins(fit)
margins(fit, "three")




