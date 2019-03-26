library(shinyrecap)


### Name: simulateEstimates
### Title: Simulates capture re-capture estimates
### Aliases: simulateEstimates

### ** Examples

library(ggplot2)
# Simulate estimates from the Mt model with no population heterogeneity
ests <- simulateEstimates(15,500,c(.1,.1,.1))

# Simulate estimates from the Mth (Normal) model with no population heterogeneity.
ests2 <- simulateEstimates(20,500,c(.1,.1,.1), htype="Normal")

df <- data.frame(est = ests[[1]],type="Mt")
df <- rbind(df, data.frame(est = ests2[[1]],type="Mth (Normal)"))
qplot(x=est, color=type, data=df, geom="density") +
  geom_vline(xintercept=500,color="purple")




