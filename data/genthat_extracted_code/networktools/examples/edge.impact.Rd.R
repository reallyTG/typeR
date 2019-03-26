library(networktools)


### Name: edge.impact
### Title: Edge Impact
### Aliases: edge.impact

### ** Examples

out <- edge.impact(depression[450:550,1:3], nodes="anhedonia")
## No test: 
out1 <- edge.impact(depression)
out2 <- edge.impact(depression, gamma=0.65,
        nodes=c("sleep_disturbance", "psychomotor_retardation"))
out3 <- edge.impact(social, nodes=c(1:6, 9), binary.data=TRUE)

summary(out1)
plot(out1, nodes="concentration_problems")

# Visualize edge impacts of psychomotor_retardation
# as a single network
plot(out1, nodes="psychomotor_retardation", type.edgeplot="single")

# Visualize the edge impacts of psychomotor_retardation
# as contrast between high and low
plot(out1, nodes="psychomotor_retardation", type.edgeplot="contrast")

# Extract the impact of psychomotor_retardation on a single edge
out1$impact[["psychomotor_retardation"]]["worthlessness", "fatigue"]

# Extract edge impacts of node Dan in edgelist format
out3$edgelist$Dan
## End(No test)




