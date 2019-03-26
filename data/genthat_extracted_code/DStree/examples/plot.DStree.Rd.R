library(DStree)


### Name: plot.DStree
### Title: Plot a DStree Object
### Aliases: plot.DStree

### ** Examples

data(cost)
# Discretize observed days to years
d.cost<-dis.cost(cost)

# Grow tree
fit <- DStree(time~prevStroke+age+sex+alcohol+smoke,status="status",data=d.cost)

#Plot tree and survival probabilities
plot(fit)
#survival probabilities are in the first plot

#Plot tree and hazard probabilities for terminal leaves 4 and 15
plot(fit,prob="haz",select=c("2","7"))



