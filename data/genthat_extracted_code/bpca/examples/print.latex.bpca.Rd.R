library(bpca)


### Name: print
### Title: Print Method for latex.bpca Objects
### Aliases: print.latex.bpca
### Keywords: multivariate

### ** Examples

##
## Example 1
## one bpca objects
##

bp <- bpca(gabriel1971)

lbp <- latex.bpca(bp)

lbp

##
## Example 2
## two bpca objects
##
y_2007 <- subset(marina,
                 year==2007)

y_2008 <- subset(marina,
                 year==2008)  

bp_2007 <- bpca(y_2007[,-c(1:2)],
                d=1:3)

bp_2008 <- bpca(y_2008[,-c(1:2)],
                d=1:2)             

lbp <- latex.bpca(list(bp_2007,
                       bp_2008))

lbp



