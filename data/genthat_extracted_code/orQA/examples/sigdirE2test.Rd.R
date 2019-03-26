library(orQA)


### Name: sigdirE2test
### Title: Summarize results from 'e2test'
### Aliases: sigdirE2test
### Keywords: regression

### ** Examples

groups <- rep(1:4,each=18)
ind <- rep(rep(1:3,each=6),4)
tdir <- sample((1:3)-2,100,rep=TRUE)
data <- matrix(rnorm(7200),nc=72)+(tdir %*% t(groups))
out <- e2test(data,groups,B=1000,rep=ind)
sigdir <- sigdirE2test(out)
table(sigdir)



