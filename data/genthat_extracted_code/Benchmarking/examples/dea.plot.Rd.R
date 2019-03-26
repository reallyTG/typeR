library(Benchmarking)


### Name: dea.plot
### Title: Plot of DEA technologies
### Aliases: dea.plot dea.plot.frontier dea.plot.isoquant
###   dea.plot.transform
### Keywords: models plot

### ** Examples


x <- matrix(c(100,200,300,500,600,100),ncol=1)
y <- matrix(c(75,100,300,400,400,50),ncol=1)

dea.plot(x,y,RTS="vrs",ORIENTATION="in-out",txt=LETTERS[1:length(x)])
dea.plot(x,y,RTS="crs",ORIENTATION="in-out",add=TRUE,lty="dashed")

dea.plot.frontier(x,y,txt=1:dim(x)[1])

n <- 10
x <- matrix(1:n,,1)
y <- matrix(x^(1.6) + abs(rnorm(n)),,1)
dea.plot.frontier(x,y,RTS="irs",txt=1:n)
dea.plot.frontier(x,y,RTS="irs2",add=TRUE,lty="dotted")

# Two different forms of irs: irs and irs2, and two different ways to
# make a frontier
id <- sample(1:n,30,replace=TRUE)
dea.plot(x[id],y[id],RTS="irs",ORIENTATION="in-out")
dea.plot.frontier(x[id],y[id],RTS="irs2")

# Difference between the FDH technology and the additive 
# FRH technology
x <- matrix(c(100,220,300,520,600,100),ncol=1)
y <- matrix(c(75,100,300,400,400,50),ncol=1)
dea.plot(x,y,RTS="fdh",ORIENTATION="in-out",txt=LETTERS[1:length(x)])
dea.plot(x,y,RTS="add",ORIENTATION="in-out",add=TRUE,lty="dashed",lwd=2)
dea.plot(x,y,RTS="fdh+",ORIENTATION="in-out",add=TRUE,
                            lty="dotted",lwd=3,col="red")

# Use of parameter in FDH+
dea.plot(x,y,RTS="fdh",ORIENTATION="in-out",txt=LETTERS[1:length(x)])
dea.plot(x,y,RTS="fdh+",ORIENTATION="in-out",add=TRUE,lty="dashed")
dea.plot(x,y,RTS="fdh+",ORIENTATION="in-out",add=TRUE,lty="dotted",param=.5)



