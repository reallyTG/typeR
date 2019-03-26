library(AdequacyModel)


### Name: pso
### Title: Adequacy of models
### Aliases: pso
### Keywords: AdequacyModel optimization PSO pso distribution survival

### ** Examples


# The objective functions below are rather difficult to be optimized. 
# However, the function pso has great results.

# Example 1 (Easom function): 

easom_function <- function(par,x){
  x1 = par[1]
  x2 = par[2]
  -cos(x1)*cos(x2)*exp(-((x1-pi)^2 + (x2-pi)^2))
}

set.seed(0)
result_1 = pso(func = easom_function, S = 500, lim_inf = c(-10,-10), lim_sup = c(10,10),
               e = 0.00001)
result_1$par

# Example 2 (Holder table function):

holder <- function(par,x){
  x1 = par[1]
  x2 = par[2]
  -abs(sin(x1)*cos(x2) * exp(abs(1 - sqrt(x1^2+x2^2)/pi)))
}

set.seed(0)
result_2 = pso(func = holder, S = 700, lim_inf = c(-10,-10), lim_sup = c(10,10),
               e = 0.00001, N=500)
result_2$par

# Example 3:

f_pso <- function(par,x){
  theta = par[1]
  -(6 + theta^2 * sin(14*theta))
}

set.seed(0)
result_3 <- pso(func = f_pso, S = 500, lim_inf = c(-2.5), lim_sup = c(2.5), e = 0.0001)
result_3$par

# TO RUN THE CODE BELOW, UNCOMMENT THE CODES.

# Example 4 (maximizing a function of the log-likelihood function):

# pdf_exp <- function(par,x){
#  lambda = par[1]
#  lambda*exp(-lambda*x)
#}

# -log-likelihood function of the exponential distribution.
#likelihood <- function(par,x){
#  lambda = par[1]
#  -sum(log(pdf_exp(par,x)))
#}

#set.seed(0)
#random_data1 = rexp(500,1)
#result_1 = pso(func = likelihood, S = 250, lim_inf = c(0), lim_sup = c(100), e = 0.0001,
#    data = random_data1, N = 50, prop = 0.2)

#x = seq(0,ceiling(max(random_data1)), length.out = 500)
#hist(random_data1, probability = TRUE)
#lines(x, pdf_exp(par = result_1$par, x), col = "blue")

# Example 5 (maximizing a function of the log-likelihood function):

# Probability density function (Weibull) 
#pdf_weibull <- function(par,x){
#  a = par[1]
#  b = par[2]
#  dweibull(x,shape=a,scale=b)
#}

# -log-likelihood function of the Weibull distribution.
#likelihood <- function(par,x){
#  -sum(log(pdf_weibull(par,x)))
#}

#set.seed(0)
#random_data2 = rweibull(250,2,2)
#result_2 = pso(func = likelihood, S = 250, lim_inf = c(0,0), lim_sup = c(10,10), e = 0.0001,
#               data = random_data2, N = 50, prop = 0.2)
    
#x = seq(0,ceiling(max(random_data2)), length.out = 500)
#hist(random_data2, probability = TRUE, ylim = c(0,0.5))
#lines(x, pdf_weibull(par = result_2$par, x), col = "blue")
    



