library(bpca)


### Name: summary.latex.bpca
### Title: Summary Method for latex.bpca Objects
### Aliases: summary.latex.bpca
### Keywords: bpca latex.bpca summary

### ** Examples

##
## Example 1
## bpca - 2d
##
# bpca
bp <- bpca(gabriel1971)

lbp <- latex.bpca(bp)
summary(lbp)

##
## Example 2
## bpca - 3d
##
lbp <- latex.bpca(bpca(gabriel1971,
                       d=1:3))

summary(lbp)

##
## Example 3
## two bpca objects
##
y_2007 <- subset(marina,
                 year == 2007)

y_2008 <- subset(marina,
                 year == 2008)  

bp_2007 <- bpca(y_2007[,-c(1:2)],
                d=1:3)

bp_2008 <- bpca(y_2008[,-c(1:2)],
                d=1:2)             

lbp <- latex.bpca(list(bp_2007,
                       bp_2008))

summary(lbp)



