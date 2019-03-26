library(compound.Cox)


### Name: dependCox.reg
### Title: Univariate Cox regression under dependent censoring.
### Aliases: dependCox.reg
### Keywords: dependent censoring copula univariate Cox regression

### ** Examples

### Reproduce Table 3 of Emura and Chen (2016) ###
data(Lung)
temp=Lung[,"train"]==TRUE
t.vec=Lung[temp,"t.vec"]
d.vec=Lung[temp,"d.vec"]
dependCox.reg(t.vec,d.vec,Lung[temp,"ZNF264"],alpha=18)
dependCox.reg(t.vec,d.vec,Lung[temp,"MMP16"],alpha=18)
dependCox.reg(t.vec,d.vec,Lung[temp,"HGF"],alpha=18)
dependCox.reg(t.vec,d.vec,Lung[temp,"HCK"],alpha=18)

#### A simulation study under dependent censoring ####
beta_true=1.5 # true regression coefficient
alpha_true=2 # true copula parameter corresponding to Kendall's tau=0.5
n=150
t.vec=d.vec=X.vec=numeric(n)
set.seed(1)
for(i in 1:n){
  X.vec[i]=runif(1)
  eta=X.vec[i]*beta_true
  U=runif(1)
  V=runif(1)
  T=-1/exp(eta)*log(1-U) # Exp(eta) distribution
  W=(1-U)^(-alpha_true) # dependence produced by the Clayton copula
  C=1/alpha_true/exp(eta)*log(  1-W+W*(1-V)^(-alpha_true/(alpha_true+1))  ) # Exp(eta) distribution
  t.vec[i]=min(T,C)
  d.vec[i]=(T<=C) 
}

dependCox.reg(t.vec,d.vec,X.vec,alpha=alpha_true,var=FALSE) # faster computation by "var=FALSE"
beta_true  # the above estimate is close to the true value
coxph(Surv(t.vec,d.vec)~X.vec)$coef
# this estimate is biased for the true value due to dependent censoring 



