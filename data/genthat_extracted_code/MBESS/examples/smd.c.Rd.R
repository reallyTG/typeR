library(MBESS)


### Name: smd.c
### Title: Standardized mean difference using the control group as the
###   basis of standardization
### Aliases: smd.c
### Keywords: models htest

### ** Examples

# Generate sample data.
set.seed(113)
g.T <- rnorm(n=25, mean=.5, sd=1)
g.C <- rnorm(n=25, mean=0, sd=1)
smd.c(Group.T=g.T, Group.C=g.C)

M.T <- .66745
M.C <- .24878
sd.c <- 1.1311
n.c <- 25
smd.c(Mean.T=M.T, Mean.C=M.C, s=sd.c)
smd.c(Mean.T=M.T, Mean.C=M.C, s=sd.c, n.C=n.c, Unbiased=TRUE)



