library(hbim)


### Name: deff.sigma
### Title: HBIM data
### Aliases: deff.sigma deff.mu deff.rho dpp.mu dpp.sigma dpp.rho
### Keywords: datasets

### ** Examples

## here is the code that produces the 6 data sets, it takes about 25 hours to run
## so it is commented out here
#NSIM<-5*10^5
#SIGMAS.POWER<-c(9,65,5000)
#SIGMAS<-log10(SIGMAS.POWER)/(2*qnorm(.975))
#SCOLORS<-c("green","blue","red")
#FACTORS<-c(1/10, 1/3, 1/2, 1)
#FCOLORS<-c("red", "green", "blue", "black")
#RHOS<-c(-.5,-.25,0, 0.25, 0.5, 0.75, 1)
#RCOLORS<- c("black","tan","yellow","blue", "green", "red", "black")
#set.seed(1234521)
#MU<-((-40:40)/10)
#deff.sigma<-eff.sigma(mu=MU, sigmas=SIGMAS, COLORS = SCOLORS, rho = 0)
#deff.mu<-eff.mu(mu=MU, factor = FACTORS, COLORS = FCOLORS, sigma = SIGMAS[2], rho = 0)
#deff.rho<-eff.rho(mu=MU, sigma = SIGMAS[2], rho = RHOS, COLORS =RCOLORS,simulate=TRUE,nsim=NSIM)
#set.seed(32401)
#dpp.sigma<-pp.sigma(MU,sigmas=SIGMAS,COLORS = SCOLORS, rho = 0,nsim=NSIM)
#set.seed(21345123)
#dpp.mu<-pp.mu(MU,factor = FACTORS, COLORS = FCOLORS, sigma = SIGMAS[2], rho = 0, nsim=NSIM)
#set.seed(435919)
#dpp.rho<-pp.rho(MU,sigma = SIGMAS[2], rho = RHOS, COLORS =RCOLORS,nsim=NSIM)



