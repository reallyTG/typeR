library(networktools)


### Name: depression
### Title: Simulated Depression Profiles
### Aliases: depression
### Keywords: datasets

### ** Examples

head(depression)
## No test: 
out1 <- impact(depression)
summary(out1)
plot(out1)

out2 <- edge.impact(depression, gamma=0.75, nodes=c("sleep_disturbance", "psychomotor_retardation"))
summary(out2)
plot(out2)

# Visualize depression networks for "low" psychomotor retardation vs. "high" psychomotor retardation
par(mfrow=c(1,2))
qgraph::qgraph(out2$lo$psychomotor_retardation, title="Low Psychomotor Retardation")
qgraph::qgraph(out2$hi$psychomotor_retardation, title="High Psychomotor Retardation")
## End(No test)




