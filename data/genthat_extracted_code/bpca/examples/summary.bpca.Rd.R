library(bpca)


### Name: summary.bpca
### Title: Summary Method for bpca Objects
### Aliases: summary.bpca
### Keywords: bpca summary multivariate

### ** Examples

##
## Example 1
## bpca - 2d
##
# bpca
bp <- bpca(gabriel1971)
summary(bp)
summary(bp,
        presentation=TRUE)

##
## Example 2
## bpca - 3d
##
bp <- bpca(gabriel1971,
           d=1:3)

# bpca
sm <- summary(bp)
str(sm)
sm
summary(bp,
        presentation=TRUE)



