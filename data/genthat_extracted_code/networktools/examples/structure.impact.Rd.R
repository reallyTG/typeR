library(networktools)


### Name: structure.impact
### Title: Network Structure Impact
### Aliases: structure.impact

### ** Examples

out <- structure.impact(depression[,1:3])
## No test: 
out1 <- structure.impact(depression)
out2 <- structure.impact(depression, gamma=0.65,
    nodes=c("sleep_disturbance", "psychomotor_retardation"))
out3 <- structure.impact(social, binary.data=TRUE)
out4 <- structure.impact(social, nodes=c(1:6, 9), binary.data=TRUE)

summary(out1)
plot(out1)

#Determine which edge drove network structure impact of "sadness"
out1$edge$sadness
## End(No test)



