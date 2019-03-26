library(networktools)


### Name: global.impact
### Title: Global Strength Impact
### Aliases: global.impact

### ** Examples

out <- global.impact(depression[,1:3])
## No test: 
out1 <- global.impact(depression)
out2 <- global.impact(depression, gamma=0.65,
    nodes=c("sleep_disturbance", "psychomotor_retardation"))
out3 <- global.impact(social, binary.data=TRUE)
out4 <- global.impact(social, nodes=c(1:6, 9), binary.data=TRUE)

summary(out1)
plot(out1)
## End(No test)



