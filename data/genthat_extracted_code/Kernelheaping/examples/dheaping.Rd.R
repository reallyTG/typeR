library(Kernelheaping)


### Name: dheaping
### Title: Kernel density estimation for heaped data
### Aliases: dheaping

### ** Examples

#Simple Rounding   ----------------------------------------------------------
xtrue=rnorm(3000)
xrounded=round(xtrue)
est <- dheaping(xrounded,rounds=1,burnin=20,samples=50)
plot(est,trueX=xtrue)

#####################
#####Heaping
#####################
#Real Data Example  ----------------------------------------------------------
# Student learning hours per week
data(students)
xheaped <- as.numeric(na.omit(students$StudyHrs))
## Not run: 
##D est <- dheaping(xheaped,rounds=c(1,2,5,10), boundary=TRUE, unequal=TRUE,burnin=20,samples=50)
##D plot(est)
##D summary(est)
## End(Not run)

#Simulate Data   ----------------------------------------------------------
Sim1 <- createSim.Kernelheaping(n=500, distribution="norm",rounds=c(1,10,100),
thresholds=c(-0.5244005, 0.5244005), sd=100)
## Not run: 
##D est <- dheaping(Sim1$xheaped,rounds=Sim1$rounds)
##D plot(est,trueX=Sim1$x)
## End(Not run)

#Biased rounding
Sim2 <- createSim.Kernelheaping(n=500, distribution="gamma",rounds=c(1,2,5,10),
                     thresholds=c(-1.2815516, -0.6744898, 0.3853205),downbias=0.2,
                     shape=4,scale=8,offset=45)
## Not run: 
##D est <- dheaping(Sim2$xheaped, rounds=Sim2$rounds, setBias=T, bw="SJ")
##D plot(est, trueX=Sim2$x)
##D summary(est)
##D tracePlots(est)
## End(Not run)

Sim3 <- createSim.Kernelheaping(n=500, distribution="gamma",rounds=c(1,2,5,10),
thresholds=c(1.84, 2.64, 3.05), downbias=0.75, Beta=-0.5, shape=4, scale=8)
## Not run: 
##D est <- dheaping(Sim3$xheaped,rounds=Sim3$rounds,boundary=TRUE,unequal=TRUE,setBias=T)
##D plot(est,trueX=Sim3$x)
## End(Not run)



