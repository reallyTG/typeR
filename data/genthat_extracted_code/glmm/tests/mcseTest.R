#some functions from glmm that we need
library(glmm)
getFamily <- glmm:::getFamily
getEk<-glmm:::getEk
addVecs<-glmm:::addVecs
tconstant <- glmm:::tconstant
addMats<-glmm:::addMats

#other functions we'll need

#here is el, likelihood
elR <- function(Y,X,eta,family.mcml){
	family.mcml<-getFamily(family.mcml)
	neta<-length(eta)

	if(family.mcml$family.glmm=="bernoulli.glmm"){
		foo<-.C(glmm:::C_cum3,eta=as.double(eta),neta=as.integer(neta), type=as.integer(1), ntrials=as.integer(1), cumout=double(1))$cumout
		mu<-.C(glmm:::C_cp3,eta=as.double(eta),neta=as.integer(neta),type=as.integer(1),ntrials=as.integer(1),cpout=double(neta))$cpout
		cdub<-.C(glmm:::C_cpp3,eta=as.double(eta),neta=as.integer(neta),type=as.integer(1),ntrials=as.integer(1),cppout=double(neta))$cppout
	}
	if(family.mcml$family.glmm=="poisson.glmm"){
		foo<-.C(glmm:::C_cum3,eta=as.double(eta),neta=as.integer(neta),type=as.integer(2),ntrials=as.integer(1),cumout=double(1))$cumout
		mu<-.C(glmm:::C_cp3,eta=as.double(eta),neta=as.integer(neta),type=as.integer(2),ntrials=as.integer(1),cpout=double(neta))$cpout
		cdub<-.C(glmm:::C_cpp3,eta=as.double(eta),neta=as.integer(neta),type=as.integer(2),ntrials=as.integer(1),cppout=double(neta))$cppout
	}

	value<-as.numeric(Y%*%eta-foo)
	gradient<-t(X)%*%(Y-mu)	
	cdubmat<-diag(cdub)
	hessian<-t(X)%*%(-cdubmat)%*%X
	
	list(value=value,gradient=gradient,hessian=hessian)
}

#for calc t
tdist2<-function(tconst,u, Dstarinv,zeta,myq){
	inside<-1+t(u)%*%Dstarinv%*%u/zeta
	logft<-tconst - ((zeta+myq)/2)*log(inside)
	as.vector(logft)
}


distRandGeneral<-function(uvec,mu,Sigma.inv){
	logDetSigmaInv<-sum(log(eigen(Sigma.inv,symmetric=TRUE)$values))
	umu<-uvec-mu
	piece2<-t(umu)%*%Sigma.inv%*%umu
	out<-as.vector(.5*(logDetSigmaInv-piece2))
	const<-length(uvec)*.5*log(2*pi)
	out<-out-const
	out
}


distRand <-
function(nu,U,z.list,mu){
	# T=number variance components
	T<-length(z.list)
	
	#nrandom is q_t
	nrand<-lapply(z.list,ncol)
	nrandom<-unlist(nrand)
	totnrandom<-sum(nrandom)
	
	mu.list<-U.list<-NULL
	if(T==1) {
		U.list[[1]]<-U
		mu.list[[1]]<-mu
		}

	if(T>1){
		U.list[[1]]<-U[1:nrandom[1]] 
		mu.list[[1]]<-mu[1:nrandom[1]]
		for(t in 2:T){
			thing1<-sum(nrandom[1:t-1])+1
			thing2<-sum(nrandom[1:t])
			U.list[[t]]<-U[thing1:thing2]
			mu.list[[t]]<-mu[thing1:thing2]
		}
	}
	
	val<-gradient<-Hessian<-rep(0,T)
	
	#for each variance component
	for(t in 1:T){
		you<-as.vector(U.list[[t]])
		mew<-as.vector(mu.list[[t]])
		Umu<-(you-mew)%*%(you-mew)
		val[t]<- -length(U)*log(2*pi)/2+as.numeric(-.5*nrandom[t]*log(nu[t])-Umu/(2*nu[t]))
		
		gradient[t]<- -nrandom[t]/(2*nu[t])+Umu/(2*(nu[t])^2)
		
		Hessian[t]<- nrandom[t]/(2*(nu[t])^2)- Umu/((nu[t])^3)
		
	}
		
	value<-sum(val)
	if(T>1) hessian<-diag(Hessian)
	if(T==1) hessian<-matrix(Hessian,nrow=1,ncol=1)
	
	list(value=value,gradient=gradient,hessian=hessian)		
}

mcseTEST <- function(mod){



	beta <- mod$beta
	nu <-mod$nu
	umat<-mod$umat
	m<-nrow(umat)

	x <- mod$x
	y <- mod$y
	Z=do.call(cbind,mod$z)
	T<-length(mod$z)
	nrand<-lapply(mod$z,ncol)
	nrandom<-unlist(nrand)


	family.glmm<-getFamily(mod$family.glmm)
	if(family.glmm$family.glmm=="bernoulli.glmm"){family_glmm=1}	
	if(family.glmm$family.glmm=="poisson.glmm"){family_glmm=2}	
	if(family.glmm$family.glmm=="binomial.glmm"){family_glmm=3}	

	pvec <-mod$pvec
	p1 <- pvec[1]
	p2 <- pvec[2]
	p3 <- pvec[3]
	zeta <- mod$zeta
	beta.pql <- mod$beta.pql
	nu.pql <- mod$nu.pql



	#need to get D*
	eek<-getEk(mod$z)
	Aks<-Map("*",eek,nu.pql)
	D.star<-addVecs(Aks) 
	D.star<-diag(D.star)
	D.star.inv<-solve(D.star)

	#need to recreate the variance matrix of  imp sampling distribution
	
	eta.star<-as.vector(x%*%beta.pql+Z%*%mod$u.pql)
	cdouble<-bernoulli.glmm()$cpp(eta.star) #still a vector
	cdouble<-diag(cdouble)
	Sigmuh.inv<- t(Z)%*%cdouble%*%Z+D.star.inv
	Sigmuh<-solve(Sigmuh.inv)

	Dstinvdiag<-diag(D.star.inv)

	tconst<-tconstant(zeta,nrow(D.star.inv),Dstinvdiag)

	eta<-b<-rep(0,m)
	lfu<-lfyu<-list(rep(c(0,0,0),m))
	lfu.twid<-matrix(data=NA,nrow=m,ncol=4)

	#stuff for the numerator of v-hat
	npar <- length(beta)+length(nu)
	Gpiece<-rep(0,npar)
	squaretop <- b
	numpiece <- matrix(data=NA, nrow=m, ncol=npar*npar)
	
	#for each simulated random effect vector
	for(k in 1:m){
		Uk<-umat[k,]  #use the simulated vector as our random effect vec
		eta<-mod$x%*%beta+Z%*%Uk # calculate eta using it
		zeros<-rep(0,length(Uk))

		#log f_theta(u_k)
		lfu[[k]]<-distRand(nu,Uk,mod$z,zeros) 

		#log f_theta(y|u_k)
		lfyu[[k]]<-elR(mod$y,mod$x,eta,family.glmm) 

		#log f~_theta(u_k)
		lfu.twid[k,1]<-tdist2(tconst,Uk,D.star.inv,zeta=zeta,myq=nrow(D.star.inv))
		lfu.twid[k,2]<-distRandGeneral(Uk,mod$u.pql,D.star.inv)
		lfu.twid[k,3]<-distRandGeneral(Uk,mod$u.pql,Sigmuh.inv)
		
		tempmax<-max(lfu.twid[k,1:3])
		blah<-exp(lfu.twid[k,1:3]-tempmax)
		pea<-c(p1,p2,p3)
		qux<-pea%*%blah
		lfu.twid[k,4]<-tempmax+log(qux)
		
		b[k]<-as.numeric(lfu[[k]]$value)+as.numeric(lfyu[[k]]$value)-lfu.twid[k,4]

		#things for the numerator now
		Gpiece <- c(lfyu[[k]]$gradient,lfu[[k]]$gradient)
		GGT <- Gpiece %*% t(Gpiece)	

		squaretop <- exp(	2*as.numeric(lfu[[k]]$value) + 2*as.numeric(lfyu[[k]]$value) - 2*lfu.twid[k,4] )
	
		numpiece[k,] <- as.numeric(GGT*squaretop)
	}

	#return to denominator of Vhat
	#bk are unnormalized log weights
	a<-max(b) #biggest logftheta(uk,y)-logftwiddle
	thing<-exp(b-a) 
	mygamma<- exp(a)*sum(thing)/m
	Vdenom <- mygamma^2 	#denom of V hat
	#now the denominator is finished

	
	#return to numerator of Vhat

	num<-apply( numpiece   ,2,sum)/m
	temp<-num/Vdenom
	Vhat<- matrix(temp,nrow=npar,ncol=npar)
	Vhat 

	Uhat <- mod$likelihood.hessian
	Uhatinv <- qr.solve(Uhat)

	UinvVUinv <- Uhatinv %*% Vhat %*% Uhatinv

	MCSE <- sqrt(diag(UinvVUinv)/m)
	MCSE
}


data(BoothHobert)
clust <- makeCluster(2)
set.seed(123)
mod.mcml1<-glmm(y~0+x1, list(y~0+z1), varcomps.names=c("z1"), data=BoothHobert, family.glmm=bernoulli.glmm, m=1000, doPQL=TRUE, cluster=clust)
all.equal(mcseTEST(mod.mcml1), as.numeric(mcse(mod.mcml1)))

stopCluster(clust)