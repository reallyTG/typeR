library(clue)


### Name: cl_agreement
### Title: Agreement Between Partitions or Hierarchies
### Aliases: cl_agreement
### Keywords: cluster

### ** Examples

## An ensemble of partitions.
data("CKME")
pens <- CKME[1 : 20]		# for saving precious time ...
summary(c(cl_agreement(pens)))
summary(c(cl_agreement(pens, method = "Rand")))
summary(c(cl_agreement(pens, method = "diag")))
cl_agreement(pens[1:5], pens[6:7], method = "NMI")
## Equivalently, using subscripting.
cl_agreement(pens, method = "NMI")[1:5, 6:7]

## An ensemble of hierarchies.
d <- dist(USArrests)
hclust_methods <-
    c("ward", "single", "complete", "average", "mcquitty")
hclust_results <- lapply(hclust_methods, function(m) hclust(d, m))
names(hclust_results) <- hclust_methods 
hens <- cl_ensemble(list = hclust_results)
summary(c(cl_agreement(hens)))
## Note that the Euclidean agreements are *very* small.
## This is because the ultrametrics differ substantially in height:
u <- lapply(hens, cl_ultrametric)
round(sapply(u, max), 3)
## Rescaling the ultrametrics to [0, 1] gives:
u <- lapply(u, function(x) (x - min(x)) / (max(x) - min(x)))
shens <- cl_ensemble(list = lapply(u, as.cl_dendrogram))
summary(c(cl_agreement(shens)))
## Au contraire ...
summary(c(cl_agreement(hens, method = "cophenetic")))
cl_agreement(hens[1:3], hens[4:5], method = "gamma")



