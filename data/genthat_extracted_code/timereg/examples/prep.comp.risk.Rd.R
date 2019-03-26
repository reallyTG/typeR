library(timereg)


### Name: prep.comp.risk
### Title: Set up weights for delayed-entry competing risks data for
###   comp.risk function
### Aliases: prep.comp.risk
### Keywords: survival

### ** Examples


data(bmt)
nn <- nrow(bmt)
entrytime <- rbinom(nn,1,0.5)*(bmt$time*runif(nn))
bmt$entrytime <- entrytime
times <- seq(5,70,by=1)

### adds weights to uncensored observations
bmtw <- prep.comp.risk(bmt,times=times,time="time",
		       entrytime="entrytime",cause="cause")

#########################################
### nonparametric estimates
#########################################
## {{{ 
### nonparametric estimates, right-censoring only 
out <- comp.risk(Event(time,cause)~+1,data=bmt,
		 cause=1,model="rcif2",
		 times=c(5,30,70),n.sim=0)
out$cum
### same as 
###out <- prodlim(Hist(time,cause)~+1,data=bmt)
###summary(out,cause="1",times=c(5,30,70))

### with truncation 
out <- comp.risk(Event(time,cause)~+1,data=bmtw,cause=1,
  model="rcif2",
  cens.weight=bmtw$cw,weights=bmtw$weights,times=c(5,30,70),
  n.sim=0)
out$cum
### same as
###out <- prodlim(Hist(entry=entrytime,time,cause)~+1,data=bmt)
###summary(out,cause="1",times=c(5,30,70))
## }}} 

#########################################
### Regression 
#########################################
## {{{ 
### with truncation correction
out <- comp.risk(Event(time,cause)~const(tcell)+const(platelet),data=bmtw,
 cause=1,cens.weight=bmtw$cw,
 weights=bmtw$weights,times=times,n.sim=0)
summary(out)

### with only righ-censoring, standard call
outn <- comp.risk(Event(time,cause)~const(tcell)+const(platelet),data=bmt,
	  cause=1,times=times,n.sim=0)
summary(outn)
## }}} 





