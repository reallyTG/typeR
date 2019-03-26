library(pegas)


### Name: summary.loci
### Title: Print and Summaries of Loci Objects
### Aliases: summary.loci [.loci print.summary.loci plot.summary.loci
###   print.loci
### Keywords: manip hplot

### ** Examples

data(jaguar)
s <- summary(jaguar)
## Not run: 
##D ## works if the device is large enough:
##D plot(s, layout = 30, las = 2)
##D layout(1)
## End(Not run)
## compute the relative frequencies:
rapply(s, function(x) x/sum(x), how = "replace")
## extract a single locus:
jaguar[, 1] # returns a vector
jaguar[, 1, drop = FALSE]



