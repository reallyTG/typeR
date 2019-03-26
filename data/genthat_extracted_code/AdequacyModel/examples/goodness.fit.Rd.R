library(AdequacyModel)


### Name: goodness.fit
### Title: Adequacy of models
### Aliases: goodness.fit
### Keywords: AdequacyModel pso AIC BIC CAIC distribution survival

### ** Examples


# Example 1:

data(carbone)

# Exponentiated Weibull - Probability density function.
pdf_expweibull <- function(par,x){
  beta = par[1]
  c = par[2]
  a = par[3]
  a * beta * c * exp(-(beta*x)^c) * (beta*x)^(c-1) * (1 - exp(-(beta*x)^c))^(a-1)
}

# Exponentiated Weibull - Cumulative distribution function.
cdf_expweibull <- function(par,x){
  beta = par[1]
  c = par[2]
  a = par[3]
  (1 - exp(-(beta*x)^c))^a
}

set.seed(0)
result_1 = goodness.fit(pdf = pdf_expweibull, cdf = cdf_expweibull, 
                        starts = c(1,1,1), data = carbone, method = "PSO",
                        domain = c(0,Inf),mle = NULL, lim_inf = c(0,0,0),
                        lim_sup = c(2,2,2), S = 250, prop=0.1, N=50)
             
x = seq(0, 6, length.out = 500)
hist(carbone, probability = TRUE)
lines(x, pdf_expweibull(x, par = result_1$mle), col = "blue")

# Example 2:

pdf_weibull <- function(par,x){
  a = par[1]
  b = par[2]
  dweibull(x, shape = a, scale = b)
}

cdf_weibull <- function(par,x){
  a = par[1]
  b = par[2]
  pweibull(x, shape = a, scale = b)
}

set.seed(0)
random_data2 = rweibull(250,2,2)
result_2 = goodness.fit(pdf = pdf_weibull, cdf = cdf_weibull, starts = c(1,1), data = random_data2,
             method = "PSO", domain = c(0,Inf), mle = NULL, lim_inf = c(0,0), lim_sup = c(10,10),
             N = 100, S = 250)

x = seq(0,ceiling(max(random_data2)), length.out = 500)
hist(random_data2, probability = TRUE)
lines(x, pdf_weibull(par = result_2$mle, x), col = "blue")

# TO RUN THE CODE BELOW, UNCOMMENT THE CODES.

# Example 3:

# Kumaraswamy Beta - Probability density function.
#pdf_kwbeta <- function(par,x){
#  beta = par[1]
#  a = par[2]
#  alpha = par[3]
#  b = par[4]
#  (a*b*x^(alpha-1)*(1-x)^(beta-1)*(pbeta(x,alpha,beta))^(a-1)*
#  (1-pbeta(x,alpha,beta)^a)^(b-1))/beta(alpha,beta) 
#}

# Kumaraswamy Beta - Cumulative distribution function.
#cdf_kwbeta <- function(par,x){
#  beta = par[1]
#  a = par[2]
#  alpha = par[3]
#  b = par[4]
#  1 - (1 - pbeta(x,alpha,beta)^a)^b
#}

#set.seed(0)
#random_data3 = rbeta(150,2,2.2)

#system.time(goodness.fit(pdf = pdf_kwbeta, cdf = cdf_kwbeta, starts = c(1,1,1,1),
#              data = random_data3, method = "PSO", domain = c(0,1), lim_inf = c(0,0,0,0),
#              lim_sup = c(10,10,10,10), S = 200, prop = 0.1, N = 40))





