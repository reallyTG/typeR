library(surveillance)


### Name: epidata_plot
### Title: Plotting the Evolution of an Epidemic
### Aliases: plot.epidata plot.summary.epidata stateplot
### Keywords: hplot methods spatial

### ** Examples

data("fooepidata")
s <- summary(fooepidata)

# evolution of the epidemic
par(las = 1)
plot(s)

# stateplot
stateplot(s, id = "15", main = "Some individual event paths")
stateplot(s, id = "1", add = TRUE, col = 2)
stateplot(s, id = "20", add = TRUE, col = 3)
legend("topright", legend = c(15, 1, 20), title = "id", lty = 1, col = 1:3,
       inset = 0.1)



