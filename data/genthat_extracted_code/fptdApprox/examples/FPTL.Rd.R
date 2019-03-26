library(fptdApprox)


### Name: FPTL
### Title: First-Passage-Time Location Function
### Aliases: FPTL is.fptl print.fptl
### Keywords: classes list methods print

### ** Examples

## Continuing the diffproc(.) examples:
## Don't show: 
Lognormal <- diffproc(c("m*x","sigma^2*x^2","dnorm((log(x)-(log(y)+(m-sigma^2/2)*(t-s)))/(sigma*sqrt(t-s)),0,1)/(sigma*sqrt(t-s)*x)", "plnorm(x,log(y)+(m-sigma^2/2)*(t-s),sigma*sqrt(t-s))"));
LognormalFEx <- diffproc(c("`h(t)`*x", "sigma^2*x^2", "dnorm((log(x)-(log(y)+`H(s,t)`-(sigma^2/2)*(t - s)))/(sigma*sqrt(t-s)),0,1)/(sigma*sqrt(t-s)*x)", "plnorm(x,log(y)+ `H(s,t)`-(sigma^2/2)*(t-s),sigma*sqrt(t-s))"))
## End(Don't show)
## Specifying a boundary
b <- "4.5 + 4*t^2 + 7*t*sqrt(t)*sin(6*sqrt(t))"

## Computing FPTL functions and creating objects of class fptl
y <- FPTL(dp = Lognormal, t0 = 0, T = 18, x0 = 1, S = b, env = list(m = 0.48,
          sigma = 0.07))
y

z <- FPTL(dp = LognormalFEx, t0 = 1, T = 10, x0 = 1, S = 15, env = list(sigma=0.1, 
          `h(t)` = "t/4", `H(s,t)` = "(t^2-s^2)/8"))
z
          
## Testing fptl objects
is.fptl(y)
is.fptl(z)



