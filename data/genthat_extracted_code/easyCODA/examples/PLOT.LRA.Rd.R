library(easyCODA)


### Name: PLOT.LRA
### Title: Plot the results of a logratio analysis
### Aliases: PLOT.LRA
### Keywords: multivariate

### ** Examples

# perform LRA on the Roman cups data set and plot the results
data(cups)
cups.LRA <- LRA(cups)
PLOT.LRA(cups.LRA, map="contribution", rescale=0.2)	



