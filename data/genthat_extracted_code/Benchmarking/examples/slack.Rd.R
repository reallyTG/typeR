library(Benchmarking)


### Name: slack
### Title: Calculate slack in an efficiency analysis
### Aliases: slack print.slack summary.slack
### Keywords: models efficiency slack

### ** Examples

x <- matrix(c(100,200,300,500,100,200,600),ncol=1)
y <- matrix(c(75,100,300,400,25,50,400),ncol=1)
dea.plot.frontier(x,y,txt=1:dim(x)[1])

e <- dea(x,y)
eff(e)

# calculate slacks
sl <- slack(x,y,e)
data.frame(e$eff,sl$slack,sl$sx,sl$sy)



