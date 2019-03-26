library(SAMCpack)


### Name: SAMCPLUS
### Title: SAMC Sampler with C++
### Aliases: SAMCPLUS

### ** Examples

## No test: 
##### Two-Dimensional Multimodal sampling
## Step 1 : Define negative log-density function as a CPP function
cppscript = "SEXP funcH(arma::vec x){
double x1 = x(0);
double x2 = x(1);
double val1 = (-std::pow((x1*sin(20*x2)+x2*sin(20*x1)),2))*cosh(sin(10*x1)*x1);
double val2 = (-std::pow((x1*cos(10*x2)-x2*sin(10*x1)),2))*cosh(cos(20*x2)*x2);
return Rcpp::wrap(val1+val2);
}"
func_ptr = RcppXPtrUtils::cppXPtr(cppscript,depends="RcppArmadillo") # as a pointer

## Step 2 : Prepare a setting option
myoption = list()
myoption$partition = c(-Inf,seq(from=-8,to=0,length.out=41))
myoption$tau       = 1.0
myoption$domain    = c(-1.1,1.1)
myoption$vecpi     = as.vector(rep(1/41,41))
myoption$niter     = 200001
myoption$stepsize  = 0.25

## Step 3 : Run The Code
res = SAMCPLUS(2,func_ptr,options=myoption)

## Step 4 : Visualize
select = seq(from=101,to=myoption$niter,by=100) # 100 burn-in, 1/100 thinning 
par(mfrow=c(1,2))
plot(res$samples[select,1], res$samples[select,2],xlab='x',ylab='y',main='samples')
barplot(as.vector(res$frequency/sum(res$frequency)),
        main="visiting frequency by energy partition",
        names.arg=myoption$partition[-1], xlab="energy")

##### (2) Use Extra Data
## Define negative log-density function as CPP function
cppscript2 = "SEXP funcH2(arma::vec x, arma::vec data){
double x1 = x(0);
double x2 = x(1);
double par1 = data(0);
double par2 = data(1);

double val1 = (-std::pow((x1*sin(par2*x2)+x2*sin(par2*x1)),2))*cosh(sin(par1*x1)*x1);
double val2 = (-std::pow((x1*cos(par1*x2)-x2*sin(par1*x1)),2))*cosh(cos(par2*x2)*x2);
return Rcpp::wrap(val1+val2);
}"
func_ptr2 = RcppXPtrUtils::cppXPtr(cppscript2,depends="RcppArmadillo") # as a pointer

## Run The Code
vecdata = as.vector(c(10,20)) 
res2 = SAMCPLUS(2,func_ptr2,data=vecdata, options=myoption)
select = seq(from=101,to=ex_niter,by=100) # 100 burn-in, 1/100 thinning 
par(mfrow=c(1,2))
plot(res2$samples[select,1], res2$samples[select,2],xlab='x',ylab='y',main='samples')
barplot(as.vector(res2$frequency/sum(res2$frequency)),
        main="visiting frequency by energy partition",
        names.arg=ex_part[2:(m+1)], xlab="energy")
## End(No test)




