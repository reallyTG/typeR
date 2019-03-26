library(circular)


### Name: plot.edf
### Title: Plot Circular Empirical Distribution Function
### Aliases: plot.edf lines.edf
### Keywords: hplot

### ** Examples

# Compare the edf's of two simulated sets of data.
data1 <- rvonmises(n=10, mu=circular(0), kappa=3)
data2 <- rvonmises(n=10, mu=circular(0), kappa=1)
plot.edf(data1, xlab="Data", ylab="EDF", main="Plots of Two EDF's")
lines.edf(data2, lty=2, col=2)

#You can use standard ecdf and plot.ecdf functions
ff <- function(x, data) {
     x <- x
     data <- data
     temp <- ecdf(data)
     temp(x)
}
plot(function(x) ff(x, data=data1), from=0, to=2*pi-3*.Machine$double.eps)

#Or curve.circular
plot.function.circular(function(x) ff(x, data=data1), from=0, 
  to=(2*pi-3*.Machine$double.eps), join=FALSE, nosort=TRUE, xlim=c(-2,2), 
  ylim=c(-2,2), modulo="asis", main="Empirical Distribution Function", 
  n=2001, tcl.text=0.25)

res <- plot.function.circular(function(x) ff(x, data=data2), from=0, 
  to=(2*pi-3*.Machine$double.eps), join=FALSE, nosort=TRUE, modulo="asis", 
  add=TRUE, col=2, n=2001)

res1 <- points(data1, plot.info=res)
points(data2, plot.info=res1, col=2, sep=0.05)

legend(-1.9, 1.9, legend=c("data1", "data2"), col=c(1,2), lty=c(1,1))



