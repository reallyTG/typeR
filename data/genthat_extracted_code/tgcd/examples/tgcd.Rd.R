library(tgcd)


### Name: tgcd
### Title: Thermoluminescence glow curve deconvolution (TGCD)
### Aliases: tgcd tgcd.default
### Keywords: package tgcd Thermoluminescence Glow curve deconvolution

### ** Examples

# Load the data.
  data(Refglow)

# Deconvolve Refglow002 with 4 peaks using the semi-analytical expression 
# derived from the one trap-one recombination (OTOR) model.
  startingPars <- 
  cbind(c(400, 550, 850, 1600), # Im
        c(1.4, 1.5, 1.6, 2),    # E
        c(420, 460, 480, 510),  # Tm
        c(0.1, 0.1, 0.1, 0.1))  # R
  tgcd(Refglow$Refglow002, npeak=4, model="lw",
       inis=startingPars, nstart=10)

# Do not run.
# Deconvolve Refglow009 with 9 peaks using the general-order equation.
# startingPars <- 
# cbind(c(9824, 21009, 27792, 50520, 7153, 5496, 6080, 1641, 2316), # Im
#       c(1.24, 1.36, 2.10, 2.65, 1.43, 1.16, 2.48, 2.98, 2.25),    # E
#       c(387, 428, 462, 488, 493, 528, 559, 585, 602),             # Tm
#       c(1.02, 1.15, 1.99, 1.20, 1.28, 1.19, 1.40, 1.01, 1.18))    # b
# tgcd(Refglow$Refglow009, npeak=9, model="g",
#      inis=startingPars, nstart=10)



