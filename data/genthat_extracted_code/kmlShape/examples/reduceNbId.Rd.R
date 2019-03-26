library(kmlShape)


### Name: reduceNbId
### Title: ~ Function: reduceNbId ~
### Aliases: reduceNbId

### ** Examples

  par(mfrow=c(1,3))
  ### Some artificial data
  myTraj <- t(sapply(1:1000,function(x)dnorm(1:200,runif(1,50,150),20)*rnorm(1,10,2)))
  matplot(t(myTraj),type="l",ylim=c(0,0.33))

  ### Election of 64 senator
  ### All individual is closed to one senators. Senators are representatives.
  election64 <- reduceNbId(id=1:1000,myTraj,nbSenators=64)
  matplot(t(election64$senatorsWide[,-1]),type="l",ylim=c(0,0.33))

  ### Election of 4 senators. They are not representatives.
  election4 <- reduceNbId(id=1:1000,myTraj,nbSenators=4)
  matplot(t(election4$senatorsWide[,-1]),type="l",ylim=c(0,0.33))



