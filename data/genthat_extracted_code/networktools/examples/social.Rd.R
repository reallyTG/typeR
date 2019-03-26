library(networktools)


### Name: social
### Title: Simulated Social Engagement Data
### Aliases: social
### Keywords: datasets

### ** Examples

head(social)
## No test: 
out1 <- impact(social, binary.data=TRUE)
summary(out1)
plot(out1)

out2 <- edge.impact(social, binary.data=TRUE, gamma=0.2, nodes=c("Kim", "Bob", "Dan"))
summary(out2)
plot(out2)

# Visualize the difference in the social networks depending
# on whether or not Joe participated (large global strength impact)
par(mfrow=c(1,2))
qgraph::qgraph(out1$Edge$lo$Joe, title="Joe Absent")
qgraph::qgraph(out1$Edge$hi$Joe, title="Joe Present")

# Visualize the difference in the social networks depending
# on whether or not Don participated (large network structure impact)
par(mfrow=c(1,2))
qgraph::qgraph(out1$Edge$lo$Don, title="Don Absent")
qgraph::qgraph(out1$Edge$hi$Don, title="Don Present")

## End(No test)



