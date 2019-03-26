library(nlsMicrobio)


### Name: competitionmodels
### Title: Competition models for simultaneous growth of two bacterial
###   flora
### Aliases: competitionmodels jameson_buchanan jameson_baranyi
###   jameson_without_lag
### Keywords: models

### ** Examples

options(digits=3)

### Example 1: fit of model jameson_buchanan  
data(competition1)
nls1 <- nls(jameson_buchanan, competition1, 
        list(lag_1 = 2, mumax_1 = 1, LOG10N0_1 = 1, tmax = 12,
     lag_2 = 2, mumax_2 = 1, LOG10N0_2 = 4))

overview(nls1)

   # Plot of theoretical curves with data
twocolors <- c("red","blue")
npoints <- 100
seq.t <- seq(0,max(competition1$t),length.out=npoints)
prednls1.1 <- predict(nls1,data.frame(t=seq.t,flora=rep(1,npoints)))
prednls1.2 <- predict(nls1,data.frame(t=seq.t,flora=rep(2,npoints)))
plot(competition1$t,competition1$LOG10N,col=twocolors[competition1$flora],xlab="t",ylab="LOG10N")
lines(seq.t,prednls1.1,col=twocolors[1])
lines(seq.t,prednls1.2,col=twocolors[2])


### Example 2 : fit of model jameson_baranyi  
data(competition1)
nls2 <- nls(jameson_baranyi, competition1, 
        list(lag_1 = 2, mumax_1 = 1, LOG10N0_1 = 1, tmax = 12,
     lag_2 = 2, mumax_2 = 1, LOG10N0_2 = 4))

overview(nls2)
plotfit(nls2)

   # Plot of theoretical curves with data
twocolors <- c("red","blue")
npoints <- 100
seq.t <- seq(0,max(competition1$t),length.out=npoints)
prednls2.1 <- predict(nls2,data.frame(t=seq.t,flora=rep(1,npoints)))
prednls2.2 <- predict(nls2,data.frame(t=seq.t,flora=rep(2,npoints)))
plot(competition1$t,competition1$LOG10N,col=twocolors[competition1$flora],xlab="t",ylab="LOG10N")
lines(seq.t,prednls2.1,col=twocolors[1])
lines(seq.t,prednls2.2,col=twocolors[2])


### Example 3: fit of model jameson_without_lag  
data(competition2)
nls3 <- nls(jameson_without_lag, competition2, 
        list(mumax_1 = 1, LOG10N0_1 = 1, tmax = 12,
     mumax_2 = 1, LOG10N0_2 = 4))

overview(nls3)
plotfit(nls3)

 # Plot of theoretical curves with data
twocolors <- c("red","blue")
npoints <- 100
seq.t <- seq(0,max(competition2$t),length.out=npoints)
prednls3.1 <- predict(nls3,data.frame(t=seq.t,flora=rep(1,npoints)))
prednls3.2 <- predict(nls3,data.frame(t=seq.t,flora=rep(2,npoints)))
plot(competition2$t,competition2$LOG10N,col=twocolors[competition2$flora],xlab="t",ylab="LOG10N")
lines(seq.t,prednls3.1,col=twocolors[1])
lines(seq.t,prednls3.2,col=twocolors[2])




