library(swissMrP)


### Name: plot
### Title: Plots 'swissMrP' Objects
### Aliases: plot.swissMrP
### Keywords: Ploting MrP

### ** Examples

## No test: 
# fake data example
vec <- pnorm(rnorm(26))
class(vec) <- "swissMrP"
plot(vec, design.dot=FALSE, main="Simulated Data", 
             lab="Heterogeneous Preferences", col="green")

plot(vec, design.dot=TRUE, main="Simulated Data", 
             lab="Heterogeneous Preferences", col="blue")
## End(No test)



