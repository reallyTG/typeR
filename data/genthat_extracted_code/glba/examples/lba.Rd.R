library(glba)


### Name: lba
### Title: Specify and fit lba models.
### Aliases: lba tablba summary.lba logLik.lba print.lba
### Keywords: statmodel

### ** Examples

data(bh08)

# reduce the data set for faster runtimes
bh1 <- bh08[c(1:300,1001:1300,2001:2300),]

# remove extreme RTs
bh1 <- bh1[bh1$rt>.180&bh1$rt<2,]

# starting values based on the quantile parameter 
# estimates from Brown and Heathcote, 2008:
# pars <- c(.25,.3,.1,.2,.9,.75,.6)

# fit the model with starting values
pars <- c(.25,.3,.1,.2,.9,.75,.6)
m1 <- lba(rt=rt,response=acc,drift=~diff-1,data=bh1,
	startpars=pars)

m1

summary(m1)

## Not run: 
##D 	# use random starting values instead
##D 	set.seed(2)
##D 	m1 <- lba(rt=rt,response=acc,drift=~diff-1,data=bh08,
##D 	startpars=pars, hessian=TRUE)
##D 
##D 	summary(m1)
##D 	
##D 	# get the parameters
##D 	pp <- m1$pars
##D 	# simulate some data from the model for the three conditions
##D 	set.seed(1)
##D 	dt1 <- rlba(1000, b=pp[3]+pp[2], A=pp[2], vs=c(pp[5],1-pp[5]), 
##D 		s=pp[1], t0=pp[4], truncdrifts=TRUE)
##D 	dt2 <- rlba(1000, b=pp[3]+pp[2], A=pp[2], vs=c(pp[6],1-pp[6]), 
##D 		s=pp[1], t0=pp[4], truncdrifts=TRUE)
##D 	dt3 <- rlba(1000, b=pp[3]+pp[2], A=pp[2], vs=c(pp[7],1-pp[7]), 
##D 		s=pp[1], t0=pp[4], truncdrifts=TRUE)
##D 	dt <- rbind(dt1,dt2,dt3)
##D 	dt$diff <- gl(3,1000)
##D 	dt$resp <- ifelse(dt$resp==2,0,1)
##D 	
##D 	# remove extreme RTs
##D 	dt <- dt[dt$rt>.180&dt$rt<2,]
##D 	
##D 	# refit the model with the simualted data
##D 	m1rf <- lba(rt=rt,response=resp,drift=~diff-1,data=dt,startpars=pp)
##D 	
##D 	data(numpp1)
##D 	
##D 	set.seed(9)
##D 	m2 <- lba(rt=rt,response=acc,drift=~diff+block,data=numpp1,
##D 	startpars=c(0.25,runif(4),0,0), scaling="fixedSD", 
##D 		sdstart=0.25, hessian=TRUE) 
##D 	tablba(m2) 
##D 	
##D 	
## End(Not run)




