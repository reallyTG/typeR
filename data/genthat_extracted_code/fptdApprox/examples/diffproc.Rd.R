library(fptdApprox)


### Name: diffproc
### Title: Diffusion Processes
### Aliases: diffproc is.diffproc as.diffproc print.diffproc
### Keywords: classes list methods print

### ** Examples

## Creating a diffproc object for the lognormal diffusion process
x <- c("m*x", "sigma^2*x^2",
       "dnorm((log(x)-(log(y)+(m-sigma^2/2)*(t-s)))/(sigma*sqrt(t-s)),0,1)/
       (sigma*sqrt(t-s)*x)", "plnorm(x,log(y)+(m-sigma^2/2)*(t-s),
       sigma*sqrt(t-s))") 

Lognormal <- diffproc(x)
Lognormal

## Creating a diffproc object for the Ornstein Uhlenbeck diffusion process
x <- c("alpha*x + beta", "sigma^2", "dnorm((x-(y*exp(alpha*(t-s))-beta*
       (1-exp(alpha*(t-s)))/alpha))/(sigma*sqrt((exp(2*alpha*(t-s)) - 1)/
       (2*alpha))),0,1)/(sigma*sqrt((exp(2*alpha*(t-s)) - 1)/(2*alpha)))",
       "pnorm(x, y*exp(alpha*(t-s)) - beta*(1 - exp(alpha*(t-s)))/alpha,
       sigma*sqrt((exp(2*alpha*(t-s)) - 1)/(2*alpha)))")
			 
OU <- diffproc(x)
OU

## Creating a diffproc object for the lognormal diffusion process with exogenous factors
x <- c("`h(t)`*x", "sigma^2*x^2", "dnorm((log(x)-(log(y)+`H(s,t)`-(sigma^2/2)*
       (t - s)))/(sigma*sqrt(t-s)),0,1)/(sigma*sqrt(t-s)*x)", "plnorm(x,log(y)+
       `H(s,t)`-(sigma^2/2)*(t-s),sigma*sqrt(t-s))")
    
LognormalFEx <- diffproc(x)
LognormalFEx

## Testing diffproc objects
is.diffproc(Lognormal)
is.diffproc(OU)
is.diffproc(LognormalFEx)



