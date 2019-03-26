library(MBESS)


### Name: smd
### Title: Standardized mean difference
### Aliases: smd
### Keywords: models htest

### ** Examples

# Generate sample data.
set.seed(113)
g.1 <- rnorm(n=25, mean=.5, sd=1)
g.2 <- rnorm(n=25, mean=0, sd=1)
smd(Group.1=g.1, Group.2=g.2)

M.x <- .66745
M.y <- .24878
sd <- 1.048
smd(Mean.1=M.x, Mean.2=M.y, s=sd)

M.x <- .66745
M.y <- .24878
n1 <- 25
n2 <- 25
sd.1 <- .95817
sd.2 <- 1.1311
smd(Mean.1=M.x, Mean.2=M.y, s.1=sd.1, s.2=sd.2, n.1=n1, n.2=n2)

smd(Mean.1=M.x, Mean.2=M.y, s.1=sd.1, s.2=sd.2, n.1=n1, n.2=n2, 
Unbiased=TRUE)




