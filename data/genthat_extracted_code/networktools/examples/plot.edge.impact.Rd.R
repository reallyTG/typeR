library(networktools)


### Name: plot.edge.impact
### Title: Plot "edge.impact" objects
### Aliases: plot.edge.impact

### ** Examples

out <- edge.impact(depression[450:550,1:3])
plot(out, nodes="anhedonia", type.edgeplot="single")
## No test: 
out1 <- edge.impact(depression)
plot(out1, nodes="concentration_problems")
plot(out1, nodes="psychomotor_retardation",
    type.edgeplot="single")

out2 <- impact(depression)
plot(out2$Edge, nodes="concentration_problems")
## End(No test)



