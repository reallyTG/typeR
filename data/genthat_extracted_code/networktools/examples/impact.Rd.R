library(networktools)


### Name: impact
### Title: Network Impact (combined function)
### Aliases: impact

### ** Examples

out <- impact(depression[,1:3])
## No test: 
out1 <- impact(depression)
out2 <- impact(depression, gamma=0.65, nodes=c("sleep_disturbance", "psychomotor_retardation"))
out3 <- impact(social, binary.data=TRUE)
out4 <- impact(social, nodes=c(1:6, 9), binary.data=TRUE)

summary(out1)
plot(out1)

# Extract the impact of psychomotor_retardation on the
# edge that runs between worthlessness and fatigue
out1$Edge$impact[["psychomotor_retardation"]]["worthlessness", "fatigue"]
## End(No test)



