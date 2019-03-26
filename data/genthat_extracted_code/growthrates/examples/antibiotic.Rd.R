library(growthrates)


### Name: antibiotic
### Title: Plate Reader Data of Bacterial Growth
### Aliases: antibiotic
### Keywords: data

### ** Examples

## plot data and determine growth rates
data(antibiotic)

dat <- subset(antibiotic, conc==0.078 & repl=="R4")
parms <- c(y0=0.01, mumax=0.2, K=0.5)
fit <- fit_growthmodel(grow_logistic, parms, dat$time, dat$value)
plot(fit); plot(fit, log="y")



