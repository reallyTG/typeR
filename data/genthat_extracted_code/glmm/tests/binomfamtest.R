#the cumulant for binomial coded in R
cumR<-function(eta,ntrials){
   if(eta <= 0){
	out <- ntrials * log1p(exp(eta))
	}
	
	if(eta>0){
	out <- ntrials * (eta + log1p(exp(-eta)))
	}
	
	out
}


library(glmm)

#choose a positive value for eta and compare to 
#calc of cum for bernoulli
eta <- 1
this <- cumR(eta,ntrials=1)
that <- bernoulli.glmm()$cum(eta)
all.equal(this,that)

#choose a negative value for eta and compare to 
#calc of cum for bernoulli
eta <- -1
this <- cumR(eta,ntrials=1)
that <- bernoulli.glmm()$cum(eta)
all.equal(this,that)

#########
#the first deriv of the cumulant for binom in R
cpR<-function(eta,ntrials){

	denom <- 1+exp(-eta)
	out <- ntrials/denom
	out
}

#choose a couple values for eta and compare to 
#calc of cp for bernoulli
eta <- 1
this <- cpR(eta,ntrials=1)
that <- bernoulli.glmm()$cp(eta)
all.equal(this,that)

eta <- -1
this <- cpR(eta,ntrials=1)
that <- bernoulli.glmm()$cp(eta)
all.equal(this,that)

#########
#the second deriv of the cumulant for binom in R
cppR<-function(eta,ntrials){

	first <- 1+exp(-eta)
	second <-  1+exp(eta)
	out <- ntrials/(first*second)
	out
}

#choose a couple values for eta and compare to 
#calc of cpp for bernoulli
eta <- 1
this <- cppR(eta,ntrials=1)
that <- bernoulli.glmm()$cpp(eta)
all.equal(this,that)

eta <- -1
this <- cppR(eta,ntrials=1)
that <- bernoulli.glmm()$cpp(eta)
all.equal(this,that)

#########
# check cumR for ntrials = 5 for both pos, neg eta
ntrials <- 5
eta <- -1
this <- cumR(eta,ntrials)
that <- 5* log(1+exp(eta))
all.equal(this, that)
eta <- 1
this <- cumR(eta,ntrials)
that <- 5* (eta+log(1+exp(-eta)))
all.equal(this, that)

# check cpR for ntrials = 5 for both pos, neg eta
ntrials <- 5
eta <- -1
this <- cpR(eta,ntrials)
that <- 5/(1+exp(-eta))
all.equal(this, that)
eta <- 1
this <- cpR(eta,ntrials)
that <- 5/(1+exp(-eta))
all.equal(this, that)

# check cppR for ntrials = 5 for both pos, neg eta
ntrials <- 5
eta <- -1
this <- cppR(eta,ntrials)
that <- 5/((1+exp(-eta))*(1+exp(eta)))
all.equal(this, that)
eta <- 1
this <- cppR(eta,ntrials)
that <- 5/((1+exp(-eta))*(1+exp(eta)))
all.equal(this, that)

#########
# check central finite differences for cumR, cpR, cppR
ntrials <- 5
eta <- 1
delta <- .0001

#going from value to deriv
this <- cpR(eta, ntrials) * delta
that <- cumR(eta+delta/2, ntrials) - cumR(eta-delta/2, ntrials)
all.equal(this, that)

#going from first to second deriv
this <- cppR(eta, ntrials) * delta
that <- cpR(eta+delta/2, ntrials) - cpR(eta-delta/2, ntrials)
all.equal(this, that)


# ntrials*cumulant for bern = cumulant for binomial in R
eta <- .8
ntrials <-2
this <- cumR(eta, ntrials)
that <- ntrials* bernoulli.glmm()$cum(eta)
all.equal(this, that)

eta <- -.8
this <- cumR(eta, ntrials)
that <- ntrials* bernoulli.glmm()$cum(eta)
all.equal(this, that)

ntrials <-5
this <- cumR(eta, ntrials)
that <- ntrials* bernoulli.glmm()$cum(eta)
all.equal(this, that)



##################  
#I am now confident in the R calcs for binom's cum and its 2 derivs
##################  


##################  
#Now I'll check the C calcs for bern against C calcs for bin
#void cum3(double *etain, int *neta, int *typein, int *ntrials, double *cumout)
#bin = bern for cumulant, ntrials = 1
eta <- 1
ntrials <-1
this <- .C(glmm:::C_cum3, eta=as.double(eta), neta=as.integer(1), typein=as.integer(3), ntrials=as.integer(ntrials), out=as.double(1.1))
that <- .C(glmm:::C_cum3, eta=as.double(eta), neta=as.integer(1), typein=as.integer(1), ntrials=as.integer(ntrials), out=as.double(1.1))
all.equal(this$out, that$out)

#bin = 2 bern for cumulant
eta <- 1
ntrials <-2
bincum <- .C(glmm:::C_cum3, eta=as.double(eta), neta=as.integer(1), typein=as.integer(3), ntrials=as.integer(ntrials), out=as.double(0.0))$out
berncum <- ntrials* .C(glmm:::C_cum3, eta=as.double(eta), neta=as.integer(1), typein=as.integer(1), ntrials=as.integer(ntrials), out=as.double(0.0))$out
all.equal(bincum, berncum)
doublecheck <- cumR(eta, ntrials)
all.equal(bincum, doublecheck)

eta <- -1
ntrials <-2
bincum <- .C(glmm:::C_cum3, eta=as.double(eta), neta=as.integer(1), typein=as.integer(3), ntrials=as.integer(ntrials), out=as.double(0.0))$out
berncum <- ntrials* .C(glmm:::C_cum3, eta=as.double(eta), neta=as.integer(1), typein=as.integer(1), ntrials=as.integer(ntrials), out=as.double(0.0))$out
all.equal(bincum, berncum)
doublecheck <- cumR(eta, ntrials)
all.equal(bincum, doublecheck)


#compare cumulant's derivative (R vs C)
eta <- 1
ntrials <-4
this <- .C(glmm:::C_cp3, eta=as.double(eta), neta=as.integer(1), typein=as.integer(3), ntrials=as.integer(ntrials), out=as.double(0.0))$out
that <- cpR(eta, ntrials)
all.equal(this, that)

#compare cumulant's 2nd derivative  (R vs C)
eta <- 1
ntrials <-4
this <- .C(glmm:::C_cpp3, eta=as.double(eta), neta=as.integer(1), typein=as.integer(3), ntrials=as.integer(ntrials), out=as.double(0.0))$out
that <- cppR(eta, ntrials)
all.equal(this, that)

#make sure cumulant still works for eta length greater than 1
neta<-6
eta <- 1:neta
ntrials <- rep(4, times=neta)
this <- .C(glmm:::C_cum3, eta=as.double(eta), neta=as.integer(neta), typein=as.integer(3), ntrials=as.integer(ntrials), out=as.double(0.0))$out
that <- 0
for(i in 1:neta){
	that <- that + cumR(eta[i], ntrials[i])
}
all.equal(this, that)
#no segfault errors and the same answer. Yay!


# one last thing to check about the cumulant calcs
eta<-1
ntrials<-1
that <- bernoulli.glmm()$cum(eta)
this <- binomial.glmm()$cum(eta, ntrials)
all.equal(this, that)
that <-  .C(glmm:::C_cum3, eta=as.double(eta), neta=as.integer(1), typein=as.integer(3), ntrials=as.integer(ntrials), out=as.double(0.0))$out
all.equal(this, that)

eta<--2
ntrials<-1
that <- bernoulli.glmm()$cum(eta)
this <- binomial.glmm()$cum(eta, ntrials)
all.equal(this, that)

eta<--2
ntrials<-2
that <- 2*bernoulli.glmm()$cum(eta)
this <- binomial.glmm()$cum(eta, ntrials)
all.equal(this, that)
that <-  .C(glmm:::C_cum3, eta=as.double(eta), neta=as.integer(1), typein=as.integer(3), ntrials=as.integer(ntrials), out=as.double(0.0))$out
all.equal(this, that)

eta<-1
ntrials<-1
that <- bernoulli.glmm()$cp(eta)
this <- binomial.glmm()$cp(eta, ntrials)
all.equal(this, that)

eta<-1
ntrials<-3
that <- 3*bernoulli.glmm()$cp(eta)
this <- binomial.glmm()$cp(eta, ntrials)
all.equal(this, that)
that <-  .C(glmm:::C_cp3, eta=as.double(eta), neta=as.integer(1), typein=as.integer(3), ntrials=as.integer(ntrials), out=as.double(0.0))$out
all.equal(this, that)

eta<-1
ntrials<-1
that <- bernoulli.glmm()$cpp(eta)
this <- binomial.glmm()$cpp(eta, ntrials)
all.equal(this, that)

eta<-1
ntrials<-3
that <- 3*bernoulli.glmm()$cpp(eta)
this <- binomial.glmm()$cpp(eta, ntrials)
all.equal(this, that)
that <-  .C(glmm:::C_cpp3, eta=as.double(eta), neta=as.integer(1), typein=as.integer(3), ntrials=as.integer(ntrials), out=as.double(0.0))$out
all.equal(this, that)

eta<--1
ntrials<-1
that <- bernoulli.glmm()$cpp(eta)
this <- binomial.glmm()$cpp(eta, ntrials)
all.equal(this, that)




