library(Benchmarking)


### Name: cost.opt
### Title: DEA optimal cost, revenue, and profit
### Aliases: cost.opt print.cost.opt summary.cost.opt revenue.opt
###   print.revenue.opt summary.revenue.opt profit.opt print.profit.opt
###   summary.profit.opt
### Keywords: models efficiency DEA

### ** Examples


x <- matrix(c(2,12, 2,8, 5,5, 10,4, 10,6, 3,13), ncol=2, byrow=TRUE)
y <- matrix(1,nrow=dim(x)[1],ncol=1)
w <- matrix(c(1.5, 1),ncol=2)

txt <- LETTERS[1:dim(x)[1]]
dea.plot(x[,1],x[,2], ORIENTATION="in",  cex=1.25)
text(x[,1],x[,2],txt,adj=c(-.7,-.2),cex=1.25)

# technical efficiency
te <- dea(x,y,RTS="vrs")
xopt <- cost.opt(x,y,w,RTS=1)
cobs <- x %*% t(w)
copt <- xopt$x %*% t(w)
# cost efficiency
ce <- copt/cobs
# allocaltive efficiency
ae <- ce/te$eff
data.frame("ce"=ce,"te"=te$eff,"ae"=ae)
print(cbind("ce"=c(ce),"te"=te$eff,"ae"=c(ae)),digits=2)

# isocost line in the technology plot
abline(a=copt[1]/w[2], b=-w[1]/w[2], lty="dashed")



