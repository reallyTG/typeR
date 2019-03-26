library(epiR)


### Name: epi.smd
### Title: Fixed-effect meta-analysis of continuous outcomes using the
###   standardised mean difference method
### Aliases: epi.smd
### Keywords: univar univar

### ** Examples

## EXAMPLE 1:
## A systematic review comparing assertive community treatment (ACT) for the 
## severely mentally ill was compared to standard care. A systematic review
## comparing ACT to standard care found three trials that assessed mental
## status after 12 months. All three trials used a different scoring system,
## so standardisation is required before they can be compared.

names <- c("Audini", "Morse", "Lehman")
mean.trt <- c(41.4, 0.95, -4.10)
mean.ctrl <- c(42.3, 0.89, -3.80)
sd.trt <- c(14, 0.76, 0.83)
sd.ctrl <- c(12.4, 0.65, 0.87)
n.trt <- c(30, 37, 67)
n.ctrl <- c(28, 35, 58)

epi.smd(mean.trt, sd.trt, n.trt, mean.ctrl, sd.ctrl, n.ctrl, 
   names, method = "cohens", conf.level = 0.95)



