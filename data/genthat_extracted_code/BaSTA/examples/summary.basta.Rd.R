library(BaSTA)


### Name: summary.basta
### Title: Summarizing and plotting Bayesian Survival Trajectory Analysis
###   (BaSTA) model outputs.
### Aliases: summary.basta print.basta plot.basta

### ** Examples

## Load BaSTA output:
data("sim1Out", package = "BaSTA")

## Print summary output:
summary(sim1Out)

## Plot traces for mortality parameters (theta):
plot(sim1Out)

## Plot traces for proportional hazards parameters (gamma):
plot(sim1Out, trace.name = "gamma")

## Plot traces for recapture probability(ies) (pi):
plot(sim1Out, trace.name = "pi")

## Plot predicted mortality and survival:
plot(sim1Out, plot.trace = FALSE)

## Change the color for each covariate on 
## the predicted vital rates:
plot(sim1Out, plot.trace = FALSE, 
     col = c("dark green", "dark blue"))

## Change the color and the legend text:
plot(sim1Out, plot.trace = FALSE, 
     col = c("dark green", "dark blue"),
     names.legend = c("Females", "Males"))

## Plot predicted mortality and survival 
## between 2 and 8 years of age:
plot(sim1Out, plot.trace = FALSE, xlim = c(2, 8))

## Plot predicted mortality and survival 
## between 2 and 8 years of age without
## credible intervals:
plot(sim1Out, plot.trace = FALSE, xlim = c(2, 8), 
     noCI = TRUE)

## Plot parameter densities and predicted vital  
## rates in the same plot (i.e. fancy):
plot(sim1Out, fancy = TRUE)

## Change colors and legend names for the 
## "fancy" plot:
plot(sim1Out, fancy = TRUE, col = c("dark green", "dark blue"),
     names.legend = c("Females", "Males"))



