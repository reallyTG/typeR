library(simPH)


### Name: MinMaxLines
### Title: Transform the simulation object to include only the min and max
###   of the constricted intervals, as well as the lower and upper bounds
###   of the middle 50 percent of the constricted intervals
### Aliases: MinMaxLines
### Keywords: internals

### ** Examples

# Load Carpenter (2002) data
data("CarpenterFdaData")

# Load survival package
library(survival)

# Run basic model
M1 <- coxph(Surv(acttime, censor) ~ prevgenx + lethal +
           deathrt1 + acutediz + hosp01  + hhosleng +
           mandiz01 + femdiz01 + peddiz01 + orphdum +
           vandavg3 + wpnoavg3 + condavg3 + orderent +
           stafcder, data = CarpenterFdaData)

 # Simulate Hazard Ratios
 Sim1 <- coxsimLinear(M1, b = "stafcder",
                      Xj = c(1237, 1600),
                      Xl = c(1000, 1000),
                      qi = "Hazard Ratio",
                      spin = TRUE, ci = 0.99)

# Find summary statistics of the constricted interval
Sum <- MinMaxLines(Sim1, clean = TRUE)




