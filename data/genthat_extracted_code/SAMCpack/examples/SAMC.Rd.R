library(SAMCpack)


### Name: SAMC
### Title: Stochastic Approximation Monte Carlo (SAMC) Sampler
### Aliases: SAMC

### ** Examples

## No test: 
##### Two-Dimensional Multimodal sampling
## Step 1 : Define negative log-density function as an R function
func_r = function(x){
x1 = x[1]; x2 = x[2];
val1 = (-(x1*sin(20*x2)+x2*sin(20*x1))^2)*cosh(sin(10*x1)*x1);
val2 = (-(x1*cos(10*x2)-x2*sin(10*x1))^2)*cosh(cos(20*x2)*x2);
return(val1+val2);
}

## Step 2 : Prepare a setting option
myoption = list()
myoption$partition = c(-Inf,seq(from=-8,to=0,length.out=41))
myoption$tau       = 1.0
myoption$domain    = c(-1.1,1.1)
myoption$vecpi     = as.vector(rep(1/41,41))
myoption$niter     = 20000
myoption$stepsize  = c(0.25, 10)

## Step 3 : Run The Code
res = SAMC(2,func_r,options=myoption)

## Step 4 : Visualize
select = seq(from=101,to=myoption$niter,by=100) # 100 burn-in, 1/100 thinning 
par(mfrow=c(1,2))
plot(res$samples[select,1], res$samples[select,2],xlab='x',ylab='y',main='samples')
barplot(as.vector(res$frequency/sum(res$frequency)),
        main="visiting frequency by energy partition",
        names.arg=myoption$partition[-1], xlab="energy")
## End(No test)




