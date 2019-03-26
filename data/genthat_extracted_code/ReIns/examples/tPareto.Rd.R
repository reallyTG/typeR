library(ReIns)


### Name: tPareto
### Title: The truncated Pareto distribution
### Aliases: dtpareto ptpareto qtpareto rtpareto
### Keywords: distribution

### ** Examples

# Plot of the PDF
x = seq(1,10,0.01)
plot(x, dtpareto(x, shape=2, endpoint=10), xlab="x", ylab="PDF", type="l")

# Plot of the CDF
x = seq(1,10,0.01)
plot(x, ptpareto(x, shape=2, endpoint=10), xlab="x", ylab="CDF", type="l")



