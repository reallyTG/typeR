library(PtProcess)


### Name: distribution
### Title: General Notes on Distribution Fitting
### Aliases: distribution
### Keywords: documentation

### ** Examples

#    Random number generation method
RNGkind("Mersenne-Twister", "Inversion")
set.seed(5)

#--------------------------------------------
#    Exponential Distribution

#    simulate a sample
p <- 1
x <- rexp(n=1000, rate=p)

#    Transform to a log scale so that -infty < log(p) < infty.
#    Hence no hard boundary, and p > 0.
#    If LL is beyond machine precision, LL <- 1e20.

neg.LL <- function(logp, data){
    x <- -sum(log(dexp(data, rate=exp(logp))))
    if (is.infinite(x)) x <- 1e20
    return(x)
}

p0 <- 5
logp0 <- log(p0)
z <- nlm(neg.LL, logp0, print.level=0, data=x)
print(exp(z$estimate))

#    Compare to closed form solution
print(exp(z$estimate)-1/mean(x))

#--------------------------------------------
#    Normal Distribution

#    simulate a sample
x <- rnorm(n=1000, mean=0, sd=1)

neg.LL <- function(p, data){
    x <- -sum(log(dnorm(data, mean=p[1], sd=exp(p[2]))))
    if (is.infinite(x)) x <- 1e20
    return(x)
}

p0 <- c(2, log(2))
z <- nlm(neg.LL, p0, print.level=0, data=x)
p1 <- c(z$estimate[1], exp(z$estimate[2]))
print(p1)

#    Compare to closed form solution
print(p1 - c(mean(x), sd(x)))

#--------------------------------------------
#    Gamma Distribution
#    shape > 0 and rate > 0
#    use exponential function to ensure above constraints

#    simulate a sample
x <- rgamma(n=2000, shape=1, rate=5)

neg.LL <- function(p, data){
    #   give unreasonable values a very high neg LL, i.e. low LL
    if (any(exp(p) > 1e15)) x <- 1e15
    else{
        x <- -sum(log(dgamma(data, shape=exp(p[1]), rate=exp(p[2]))))
        if (is.infinite(x)) x <- 1e15
    }
    return(x)
}

p0 <- c(2, 2)
z <- optim(p0, neg.LL, data=x)
print(exp(z$par))

z <- nlm(neg.LL, p0, print.level=0, data=x)
print(exp(z$estimate))

#--------------------------------------------
#    Beta Distribution
#    shape1 > 0 and shape2 > 0
#    use exponential function to ensure above constraints

#    simulate a sample
x <- rbeta(n=5000, shape1=0.5, shape2=0.2)

#    exclude those where x=0
x <- x[x!=1]

neg.LL <- function(p, data)
    -sum(log(dbeta(data, shape1=exp(p[1]), shape2=exp(p[2]))))

p0 <- log(c(0.1, 0.1))

z <- optim(p0, neg.LL, data=x)
print(exp(z$par))

z <- nlm(neg.LL, p0, typsize=c(0.01, 0.01), print.level=0, data=x)
print(exp(z$estimate))

#--------------------------------------------
#    Weibull Distribution
#    shape > 0 and scale > 0
#    use exponential function to ensure above constraints

#    simulate a sample
x <- rweibull(n=2000, shape=2, scale=1)

neg.LL <- function(p, data)
    -sum(log(dweibull(data, shape=exp(p[1]), scale=exp(p[2]))))

p0 <- log(c(0.1, 0.1))
z <- optim(p0, neg.LL, data=x)
print(exp(z$par))

#--------------------------------------------
#    Pareto Distribution
#    lambda > 0
#    Use exponential function to enforce constraint

#    simulate a sample
x <- rpareto(n=2000, lambda=2, a=1)

neg.LL <- function(p, data){
    #   give unreasonable values a very high neg LL, i.e. low LL
    if (exp(p) > 1e15) x <- 1e15
    else x <- -sum(log(dpareto(data, lambda=exp(p), a=1)))
    if (is.infinite(x)) x <- 1e15
    return(x)
}

p0 <- log(0.1)
z <- nlm(neg.LL, p0, print.level=0, data=x)
print(exp(z$estimate))

#--------------------------------------------
#    Tapered Pareto Distribution
#    lambda > 0  and  theta > 0

# simulate a sample
x <- rtappareto(n=2000, lambda=2, theta=4, a=1) 

neg.LL <- function(p, data){
    x <- -ltappareto(data, lambda=p[1], theta=p[2], a=1)
    attr(x, "gradient") <- -attr(x, "gradient")
    attr(x, "hessian") <- -attr(x, "hessian")
    return(x)
}

#   use optim to get approx initial value 
p0 <- c(3, 5)
z1 <- optim(p0, neg.LL, data=x) 
p1 <- z1$par
print(p1)
print(neg.LL(p1, x))

#   nlm with analytic gradient and hessian
z2 <- nlm(neg.LL, p1, data=x, hessian=TRUE) 
p2 <- z2$estimate
print(z2)

#    Newton Raphson Method
p3 <- p1
iter <- 0
repeat{
    LL <- ltappareto(data=x, lambda=p3[1], theta=p3[2], a=1)
    p3 <- p3 - as.numeric(solve(attr(LL,"hessian")) %*% 
                 matrix(attr(LL,"gradient"), ncol=1))
    iter <- iter + 1
    if ((max(abs(attr(LL,"gradient"))) < 1e-8) |
        (iter > 100)) break
}
print(iter)
print(LL)
print(p3)



