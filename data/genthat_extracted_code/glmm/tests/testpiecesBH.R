library(glmm)
data(BoothHobert)
clust <- makeCluster(2)
set.seed(1234)
mod.mcml1<-glmm(y~0+x1,list(y~0+z1),varcomps.names=c("z1"), data=BoothHobert, family.glmm=bernoulli.glmm, m=21, doPQL=TRUE, debug=TRUE, cluster=clust)
mod.mcml<-mod.mcml1$mod.mcml
z<-mod.mcml$z[[1]]
x<-mod.mcml$x
y<-mod.mcml$y

stuff<-mod.mcml1$debug
beta.pql<-stuff$beta.pql
nu.pql<-stuff$nu.pql
u.pql<-u.star<-stuff$u.star
umat<-stuff$umat
m1<-stuff$m1

family.glmm<-bernoulli.glmm

objfun<-glmm:::objfun
getEk<-glmm:::getEk
addVecs<-glmm:::addVecs

############################################
#this should be the same as elc
logfyuk<-function(eta,x,y){
	value<-sum(y*eta)-sum(log(1+exp(eta)))
	Pi<-exp(eta)/(1+exp(eta))
	gradient<-sum(y*x)-sum(x*Pi)
	hessian<-sum(x^2*(-Pi+Pi^2)	)
	list(value=value,gradient=gradient,hessian=hessian)
}

#compare elc and logfyuk for a value of eta
eta<-rep(2,150)
this<-.C(glmm:::C_elc,as.double(mod.mcml$y), as.double(mod.mcml$x), as.integer(nrow(mod.mcml$x)), as.integer(ncol(mod.mcml$x)), as.double(eta), as.integer(1), as.integer(1), value=double(1), gradient=double(ncol(mod.mcml$x)), hessian=double((ncol(mod.mcml$x)^2)))
that<-logfyuk(eta,mod.mcml$x,mod.mcml$y)
all.equal(as.numeric(this$value),as.numeric(that$value))
all.equal(as.numeric(this$gradient),as.numeric(that$gradient))
all.equal(as.numeric(this$hessian),as.numeric(that$hessian))

#compare elval to logfyuk
this<-.C(glmm:::C_elval, as.double(mod.mcml$y), as.integer(nrow(mod.mcml$x)), as.integer(ncol(mod.mcml$x)), as.double(eta), as.integer(1), as.integer(1), value=double(1))
all.equal(as.numeric(this$value),as.numeric(that$value))

#compare elGH to logfyuk
this<-.C(glmm:::C_elGH, as.double(mod.mcml$y), as.double(mod.mcml$x), as.integer(nrow(mod.mcml$x)), as.integer(ncol(mod.mcml$x)), as.double(eta), as.integer(1), as.integer(1), gradient=double(ncol(mod.mcml$x)), hessian=double((ncol(mod.mcml$x)^2)))
all.equal(as.numeric(this$gradient),as.numeric(that$gradient))
all.equal(as.numeric(this$hessian),as.numeric(that$hessian))

############################################
#want to check distRand when we use a normal distribution to get our random effects
#check written for BH
distRandCheck<-function(nu,uvec,muvec){
	ukmuk<-sum((uvec-muvec)^2)
	value<- -length(uvec)*.5*log(2*pi)-5*log(nu)-ukmuk/(2*nu)
	gradient<- -5/nu +ukmuk/(2*nu^2)
	hessian<- 5/(nu^2)-ukmuk/(nu^3)
	hessian<-as.matrix(hessian)
	list(value=value,gradient=gradient,hessian=hessian)
}

#function written originally in R
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
		val[t]<--length(you)*.5*log(2*pi)+ as.numeric(-.5*nrandom[t]*log(nu[t])-Umu/(2*nu[t]))
		
		gradient[t]<- -nrandom[t]/(2*nu[t])+Umu/(2*(nu[t])^2)
		
		Hessian[t]<- nrandom[t]/(2*(nu[t])^2)- Umu/((nu[t])^3)
		
	}
		
	value<-sum(val)
	if(T>1) hessian<-diag(Hessian)
	if(T==1) hessian<-matrix(Hessian,nrow=1,ncol=1)
	
	list(value=value,gradient=gradient,hessian=hessian)		
}


you<-umat[1,]
this<-distRandCheck(2,you,u.pql)
that<-distRand(2,you,mod.mcml$z,u.pql)

all.equal(this,that)

#use finite diffs to make sure distRandCheck (and distRand) have correct derivs
del<-10^(-9)
thisdel<-distRandCheck(2+del,you,u.pql)
firstthing<-thisdel$value-this$value
secondthing<-as.vector(this$gradient%*%del)
all.equal(firstthing,secondthing)
#firstthing
#secondthing
#firstthing-secondthing

#compare the gradient and hessian of the C functions by using these functions
#(the value is checked in distRandGeneral)

mynu<-2
mymu<-rep(0,10)
T<-1
nrandom<-10
meow<-c(0,10)
set.seed(1234)
myyou<-rnorm(10)
hohum<-.C(glmm:::C_distRand3C,as.double(mynu), as.double(mymu), as.integer(T), as.integer(nrandom), as.integer(meow), as.double(myyou), double(T), double(T^2)) 
drcheck<-distRandCheck(mynu,myyou,mymu)
all.equal(drcheck$gradient,hohum[[7]])
all.equal(drcheck$hessian,matrix(hohum[[8]],nrow=T,byrow=F))

###############################################
#distRandGeneral in R first
distRandGeneral<-function(uvec,mu,Sigma.inv){
	logDetSigmaInv<-sum(log(eigen(Sigma.inv,symmetric=TRUE)$values))
	umu<-uvec-mu
	piece2<-t(umu)%*%Sigma.inv%*%umu
	out<-as.vector(.5*(logDetSigmaInv-piece2))
	const<-length(uvec)*.5*log(2*pi)
	out<-out-const
	out
}

D.star<-2*diag(10)
D.star.inv<-.5*diag(10)
A.star<-sqrt(2)*diag(10)
this<-distRandGeneral(you,u.pql,D.star.inv)
all.equal(this,that$value)

#check distRandGenC
logdet<-sum(log(eigen(D.star.inv)$values))
stuff<-.C(glmm:::C_distRandGenC,as.double(D.star.inv),as.double(logdet), as.integer(length(you)), as.double(you), as.double(u.pql), double(1))[[6]]
all.equal(that$value,stuff)


############################################
#want to check that the value of objfun is the same for a value of nu and beta
vars <- new.env(parent = emptyenv())
debug<-mod.mcml1$debug
vars$m1 <- debug$m1
m2 <- debug$m2
m3 <- debug$m3
vars$zeta <- 5
vars$cl <- mod.mcml1$cluster
registerDoParallel(vars$cl)                   #making cluster usable with foreach
vars$no_cores <- length(vars$cl)
vars$mod.mcml<-mod.mcml1$mod.mcml
vars$nu.pql <- debug$nu.pql
vars$umat<-debug$umat
vars$newm <- nrow(vars$umat)
vars$u.star<-debug$u.star
D <- vars$D.star <- Dstarnotsparse<-2*diag(10)
D.inv <- D.star.inv <-.5*diag(10)

getEk<-glmm:::getEk
addVecs<-glmm:::addVecs
genRand<-glmm:::genRand

vars$family.glmm<-mod.mcml1$family.glmm
vars$ntrials<-1
beta.pql <- debug$beta.pql

simulate <- function(vars, Dstarnotsparse, m2, m3, beta.pql, D.star.inv){
  #generate m1 from t(0,D*)
  if(vars$m1>0) genData<-rmvt(ceiling(vars$m1/vars$no_cores),sigma=Dstarnotsparse,df=vars$zeta,type=c("shifted"))
  if(vars$m1==0) genData<-NULL		
  
  #generate m2 from N(u*,D*)
  if(m2>0) genData2<-genRand(vars$u.star,vars$D.star,ceiling(m2/vars$no_cores))
  if(m2==0) genData2<-NULL
  
  
  #generate m3 from N(u*,(Z'c''(Xbeta*+zu*)Z+D*^{-1})^-1)
  if(m3>0){
    Z=do.call(cbind,vars$mod.mcml$z)
    eta.star<-as.vector(vars$mod.mcml$x%*%beta.pql+Z%*%vars$u.star)
    if(vars$family.glmm$family.glmm=="bernoulli.glmm") {cdouble<-vars$family.glmm$cpp(eta.star)}
    if(vars$family.glmm$family.glmm=="poisson.glmm"){cdouble<-vars$family.glmm$cpp(eta.star)}
    if(vars$family.glmm$family.glmm=="binomial.glmm"){cdouble<-vars$family.glmm$cpp(eta.star, vars$ntrials)}
    #still a vector
    cdouble<-Diagonal(length(cdouble),cdouble)
    Sigmuh.inv<- t(Z)%*%cdouble%*%Z+D.star.inv
    Sigmuh<-solve(Sigmuh.inv)
    genData3<-genRand(vars$u.star,Sigmuh,ceiling(m3/vars$no_cores))
  }
  if(m3==0) genData3<-NULL
  
  #	#these are from distribution based on data
  #	if(distrib=="tee")genData<-genRand(sigma.gen,s.pql,mod.mcml$z,m1,distrib="tee",gamm)
  #	if(distrib=="normal")genData<-genRand(sigma.pql,s.pql,mod.mcml$z,m1,distrib="normal",gamm)
  #	#these are from standard normal
  #	ones<-rep(1,length(sigma.pql))
  #	zeros<-rep(0,length(s.pql))
  #	genData2<-genRand(ones,zeros,mod.mcml$z,m2,distrib="normal",gamm)
  
  umat<-rbind(genData,genData2,genData3)
  m <- nrow(umat)
  list(umat=umat, m=m, Sigmuh.inv=Sigmuh.inv)
}

clusterSetRNGStream(vars$cl, 1234)

clusterExport(vars$cl, c("vars", "Dstarnotsparse", "m2", "m3", "beta.pql", "D.star.inv", "simulate", "genRand"), envir = environment())     #installing variables on each core
noprint <- clusterEvalQ(vars$cl, umatparams <- simulate(vars=vars, Dstarnotsparse=Dstarnotsparse, m2=m2, m3=m3, beta.pql=beta.pql, D.star.inv=D.star.inv))

vars$nbeta <- 1
vars$p1=vars$p2=vars$p3=1/3

objfun<-glmm:::objfun

umats <- clusterEvalQ(vars$cl, umatparams$umat)
umat <- Reduce(rbind, umats)

Sigmuh.invs <- clusterEvalQ(vars$cl, umatparams$Sigmuh.inv)
Sigmuh.inv <- Sigmuh.invs[[1]]
Sigmuh <- solve(Sigmuh.inv)

dbb<-db<-b<-rep(0,vars$newm)
sigsq<-nu<-2
beta<-6
Z<-vars$mod.mcml$z[[1]]
A<-sqrt(2)*diag(10)


eta.star<-x*beta.pql+as.vector(Z%*%u.star)
cdouble<-as.vector(bernoulli.glmm()$cpp(eta.star)) #still a vector
cdouble<-diag(cdouble)

piece3<-rep(0,3)

#calculate objfun's value for comparison
cache<-new.env(parent = emptyenv())

that<-objfun(c(beta,nu), cache=cache,vars=vars)

#get t stuff ready
tconstant<-glmm:::tconstant
zeta<-5
tconst<-tconstant(zeta,10,diag(D.star.inv))
tdist2<-function(tconst,u, Dstarinv,zeta,myq){
	inside<-1+t(u)%*%Dstarinv%*%u/zeta
	logft<-tconst - ((zeta+myq)/2)*log(inside)
	as.vector(logft)
}


#now go through row by row of umat 
#ie go through each vector of gen rand eff
for(k in 1:vars$newm){
	uvec<-umat[k,]
	eta<-x*beta+as.vector(Z%*%uvec)

	piece1<- logfyuk(eta,x,y)$value	
	piece2<- distRandCheck(nu,uvec,rep(0,10))$value
	
	piece3[1]<-tdist2(tconst,uvec,D.star.inv,zeta,10)
	piece3[2]<- distRandGeneral(uvec, vars$u.star, D.star.inv)
	piece3[3]<-distRandGeneral(uvec,vars$u.star,Sigmuh.inv)

	damax<-max(piece3)
	blah<-sum(exp(piece3-damax)/3)
	lefoo<-damax+log(blah)
	b[k]<-piece1+piece2-lefoo
	}	
a<-max(b)
top<-exp(b-a)
value<-a+log(mean(top))

all.equal(value,that$value)	
#Given generated random effects, the value of the objective function is correct.
#This plus the test of finite diffs for objfun should be enough.

stopCluster(clust)


