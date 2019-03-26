library(Hmisc)


### Name: list.tree
### Title: Pretty-print the Structure of a Data Object
### Aliases: list.tree
### Keywords: documentation

### ** Examples

X <- list(a=ordered(c(1:30,30:1)),b=c("Rick","John","Allan"),
          c=diag(300),e=cbind(p=1008:1019,q=4))
list.tree(X)
# In R you can say str(X)



