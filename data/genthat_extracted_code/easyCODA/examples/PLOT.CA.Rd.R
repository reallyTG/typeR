library(easyCODA)


### Name: PLOT.CA
### Title: Plot the results of a correspondence analysis
### Aliases: PLOT.CA
### Keywords: multivariate

### ** Examples

data(cups)
cups.CA <- CA(cups)
PLOT.CA(cups.CA, map="contribution", rescale=0.2)	
# Compare the above plot with that of an LRA -- practically the same
cups.LRA <- LRA(cups)
PLOT.LRA(cups.LRA, map="contribution", rescale=0.2)



