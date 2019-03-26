library(BayesValidate)


### Name: validate
### Title: Tests correctness of Bayesian Model-Fitting Software
### Aliases: validate
### Keywords: debugging

### ** Examples

set.seed(314)

##functions for generating parameters mu, sigma^2 from their prior distribution
rinvchisq <- function(n,v,s){
        alpha <- v/2
        beta <- alpha*s;
        draws <- 1/rgamma(n,alpha,beta)
        return(draws)}

generate.param <- function(hyper){
	mu.0 <- hyper[1]
	kappa.0 <- hyper[2]
	nu.0 <- hyper[3]
	sigsq.0 <- hyper[4]
	sigsq <- rinvchisq(1, nu.0, sigsq.0)
	mu <- rnorm(1, mu.0, sqrt(sigsq/kappa.0))
	return(c(sigsq,mu))}

##generate normal data with mean mu, variance sigma^2, sample size n
generate.data <- function(params,n){
	y <- rnorm(n,params[2],sqrt(params[1]))
	return(y)}

##generate from the posterior distribution of mu, sigma^2
analyze.data <- function(y,params.true,inputs){
	n <- length(y)
	mu.0 <- inputs[1]
	kappa.0 <- inputs[2]
	nu.0 <- inputs[3]
	sigsq.0 <- inputs[4]
	n.draws <- inputs[5]
	kappa.n <- kappa.0 + n
	mu.n <- (mu.0*kappa.0 + sum(y))/kappa.n
	nu.n <- nu.0 + n
	sigsq.n <- ( nu.0*sigsq.0 + (n-1)*var(y) + 
		kappa.0*n*(mean(y) - mu.0)^2/kappa.n ) / nu.n 

	
	sigsq.post <- rinvchisq(n.draws, nu.n, sigsq.n)

	var.mu.post <- sigsq.post/(kappa.n)
	mu.post <- rnorm(n.draws, mu.n, sqrt(var.mu.post))

	return(cbind(sigsq.post,mu.post))}

##generate from the posterior distribution of mu, sigma^2
##error sampling sigma^2
analyze.data.error1 <- function(y,params.true,inputs){
	n <- length(y)
	mu.0 <- inputs[1]
	kappa.0 <- inputs[2]
	nu.0 <- inputs[3]
	sigsq.0 <- inputs[4]
	n.draws <- inputs[5]
	kappa.n <- kappa.0 + n
	mu.n <- (mu.0*kappa.0 + sum(y))/kappa.n
	nu.n <- nu.0 + n
	sigsq.n <- ( nu.0*sigsq.0 + (n-1)*var(y) + 
		kappa.0*n*(mean(y) - mu.0)^2/kappa.n ) / nu.n 

	sigsq.post <- rinvchisq(n.draws, nu.n, sigsq.0)

	var.mu.post <- sigsq.post/(kappa.n)
	mu.post <- rnorm(n.draws, mu.n, sqrt(var.mu.post))

	return(cbind(sigsq.post,mu.post))}

##generate from the posterior distribution of mu, sigma^2
##error sampling mu
analyze.data.error2 <- function(y,params.true,inputs){
	n <- length(y)
	mu.0 <- inputs[1]
	kappa.0 <- inputs[2]
	nu.0 <- inputs[3]
	sigsq.0 <- inputs[4]
	n.draws <- inputs[5]
	kappa.n <- kappa.0 + n
	mu.n <- (mu.0*kappa.0 + sum(y))/kappa.n
	nu.n <- nu.0 + n
	sigsq.n <- ( nu.0*sigsq.0 + (n-1)*var(y) + 
		kappa.0*n*(mean(y) - mu.0)^2/kappa.n ) / nu.n 

	
	sigsq.post <- rinvchisq(n.draws, nu.n, sigsq.n)

	var.mu.post <- sigsq.post/(kappa.n)
	mu.post <- rnorm(n.draws, mu.n, var.mu.post)

	return(cbind(sigsq.post,mu.post))}

##function inputs
hyper<-c(6,5,5,7)
n<-20
n.draws<-5000

generate.param.inputs<-hyper
generate.data.inputs<-n
analyze.data.inputs<-c(hyper,n.draws)

##run validation function for the three model-fitting functions
tst.0 <- validate(generate.param = generate.param, generate.param.inputs = 
	generate.param.inputs, generate.data = generate.data, 
	generate.data.inputs = generate.data.inputs, analyze.data = 
	analyze.data, analyze.data.inputs = analyze.data.inputs, 
	n.rep = 20, params.batch = expression(sigma^2,mu), n.batch = c(1,1))


tst.1 <- validate(generate.param = generate.param, generate.param.inputs = 
	generate.param.inputs, generate.data = generate.data, 
	generate.data.inputs = generate.data.inputs, analyze.data = 
	analyze.data.error1, analyze.data.inputs = analyze.data.inputs, 
	n.rep = 20, params.batch = expression(sigma^2,mu), n.batch = c(1,1))


tst.2 <- validate(generate.param = generate.param, generate.param.inputs = 
	generate.param.inputs, generate.data = generate.data, 
	generate.data.inputs = generate.data.inputs, analyze.data = 
	analyze.data.error2, analyze.data.inputs = analyze.data.inputs, 
	n.rep = 20, params.batch = expression(sigma^2,mu), n.batch = c(1,1))




