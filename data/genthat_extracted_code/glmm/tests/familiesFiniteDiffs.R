library(glmm)
eta<-1.23
neta<-length(eta)
delta<-rep(.0000000001,neta)

#check derivatives for bernoulli using finite differences
foo<-.C(glmm:::C_cp3,eta=as.double(eta),neta=as.integer(neta),type=as.integer(1),ntrials=as.integer(1),cpout=double(neta))$cpout
this<-foo*delta
that<-.C(glmm:::C_cum3,eta=as.double(eta+delta),neta=as.integer(neta),type=as.integer(1),ntrials=as.integer(1),cumout=double(neta))$cumout-.C(glmm:::C_cum3,eta=as.double(eta),neta=as.integer(neta),type=as.integer(1), ntrials=as.integer(1), cumout=double(neta))$cumout
all.equal(this,that)

this<-.C(glmm:::C_cpp3,eta=as.double(eta),neta=as.integer(neta),type=as.integer(1),ntrials=as.integer(1),cppout=double(neta))$cppout*delta
that<-.C(glmm:::C_cp3,eta=as.double(eta+delta),neta=as.integer(neta),type=as.integer(1),ntrials=as.integer(1),cpout=double(neta))$cpout-.C(glmm:::C_cp3,eta=as.double(eta),neta=as.integer(neta),type=as.integer(1),ntrials=as.integer(1),cpout=double(neta))$cpout
all.equal(this,that)

#check derivatives for poisson using finite differences
foo<-.C(glmm:::C_cp3,eta=as.double(eta),neta=as.integer(neta),type=as.integer(2),ntrials=as.integer(1),cpout=double(neta))$cpout
this<-foo*delta
that<-.C(glmm:::C_cum3,eta=as.double(eta+delta),neta=as.integer(neta),type=as.integer(2),ntrials=as.integer(1),cumout=double(neta))$cumout-.C(glmm:::C_cum3,eta=as.double(eta),neta=as.integer(neta),type=as.integer(2), ntrials=as.integer(1),cumout=double(neta))$cumout
all.equal(this,that)

this<-.C(glmm:::C_cpp3,eta=as.double(eta),neta=as.integer(neta),type=as.integer(2),ntrials=as.integer(1),cppout=double(neta))$cppout*delta
that<-.C(glmm:::C_cp3,eta=as.double(eta+delta),neta=as.integer(neta),type=as.integer(2),ntrials=as.integer(1),cpout=double(neta))$cpout-.C(glmm:::C_cp3,eta=as.double(eta),neta=as.integer(neta),type=as.integer(2),ntrials=as.integer(1),cpout=double(neta))$cpout
all.equal(this,that)


