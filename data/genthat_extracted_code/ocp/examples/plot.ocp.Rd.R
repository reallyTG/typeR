library(ocp)


### Name: plot.ocp
### Title: Plot Object
### Aliases: plot.ocp

### ** Examples

simdatapts<- c(rnorm(n = 50), rnorm(n=50, 100))
ocpd1<- onlineCPD(simdatapts, getR=TRUE)
plot(ocpd1) # basic plot
plot(ocpd1, data= simdatapts) # plot with the original data
plot(ocpd1, trueCPs = c(1, 51)) # plot with showing the true changepoints
plot(ocpd1, main_title="Example plot", showmaxes = FALSE) # not showing max probabilities
plot(ocpd1, graph_changepoints=FALSE) # not showing the changepoints plot
plot(ocpd1, graph_probabilities=FALSE) # not showing the R matrix
plot(ocpd1, showRprobs=FALSE, showcps= FALSE)#plotting r with maxes but no probabilities,
# and not showing the locations of the found changepoints




