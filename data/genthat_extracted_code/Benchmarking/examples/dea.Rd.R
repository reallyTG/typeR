library(Benchmarking)


### Name: dea
### Title: DEA efficiency
### Aliases: dea deaSlack print.Farrell summary.Farrell
### Keywords: models efficiency

### ** Examples

x <- matrix(c(100,200,300,500,100,200,600),ncol=1)
y <- matrix(c(75,100,300,400,25,50,400),ncol=1)
dea.plot.frontier(x,y,txt=TRUE)

e <- dea(x,y)
eff(e)
print(e)
summary(e)
lambda(e)

# Input savings potential for each firm
(1-eff(e)) * x
(1-e$eff) * x

# calculate slacks
el <- dea(x,y,SLACK=TRUE)
data.frame(e$eff,el$eff,el$slack,el$sx,el$sy)

# Fully efficient units, eff==1 and no slack
which(eff(e) == 1 & !el$slack)

# fdh+ with limits in the interval [.7, 1.2]
dea(x,y,RTS="fdh+", param=c(.7,1.2))



