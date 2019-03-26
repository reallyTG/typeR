## ---- include=FALSE------------------------------------------------------
library(RBesT)
library(dplyr)
library(purrr)
library(knitr)
library(bayesplot)
library(ggplot2)
theme_set(theme_bw())
set.seed(3453456)
knitr::opts_chunk$set(
    fig.width = 1.62*4,
    fig.height = 4
    )
## setup up fast sampling when run on CRAN
if (!identical(Sys.getenv("NOT_CRAN"), "true")) {
    options(RBesT.MC.warmup=250, RBesT.MC.iter=500, RBesT.MC.chains=2)
}

## ----results="asis",echo=FALSE-------------------------------------------
hdata <- data.frame(study=1:6,
                    sd=c(12.11, 10.97, 10.94, 9.41, 10.97, 10.95),
                    df=c(597, 60, 548, 307, 906, 903)
                    )
kable(hdata, digits=2)

## ------------------------------------------------------------------------
hdata <- mutate(hdata,
                alpha=df/2,
                beta=alpha/sd^2,
                logvar_mean=digamma(alpha) - log(beta),
                logvar_var=psigamma(alpha,1))

## ----results="asis",echo=FALSE-------------------------------------------
kable(hdata, digits=4)

## ------------------------------------------------------------------------
map_mc <- gMAP(cbind(logvar_mean, sqrt(logvar_var)) ~ 1 | study, data=hdata,
               tau.dist="HalfNormal", tau.prior=sqrt(2)/2,
               beta.prior=cbind(4.8, 100))


map_mc

summary(map_mc)

plot(map_mc)$forest_model

## ------------------------------------------------------------------------
map_mc_post <- as.matrix(map_mc)
sd_trans <- compose(sqrt, exp)
mcmc_intervals(map_mc_post, regex_pars="theta", transformation=sd_trans)

map_sigma_mc <- sd_trans(map_mc_post[,c("theta_pred")])
map_sigma <- automixfit(map_sigma_mc, type="gamma")

plot(map_sigma)$mix

## 95% interval MAP for the sampling standard deviation
summary(map_sigma)

## ------------------------------------------------------------------------
gamma_dist <- mixgamma(c(1, 18, 6))

## logGamma density
dlogGamma <- function(z, a, b, log=FALSE) {
    n <- exp(z)
    if(!log) {
        return(dgamma(n, a, b) * n)
    } else {
        return(dgamma(n, a, b, log=TRUE) + z)
    }
}

a <- gamma_dist[2,1]
b <- gamma_dist[3,1]
m <- digamma(a) - log(b)
v <- psigamma(a,1)

## compare simulated histogram of log transformed Gamma variates to
## analytic density and approximate normal
sim <- rmix(gamma_dist, 1E5)
mcmc_hist(data.frame(logGamma=log(sim)), freq=FALSE, binwidth=0.1) +
    overlay_function(fun=dlogGamma, args=list(a=a,b=b), aes(linetype="LogGamma")) +
    overlay_function(fun=dnorm, args=list(mean=m, sd=sqrt(v)), aes(linetype="NormalApprox"))


## ----echo=FALSE----------------------------------------------------------
qgammaLog <- function(p, a, b) {
    log(qgamma(p, a, b))
}
VqgammaLog <- Vectorize(qgammaLog)

var2gamma <- function(nu, sigma) {
    c(a=nu/2, b=nu/(2*sigma^2))
}

var2logNormal <- function(nu, sigma) {
    gamma <- var2gamma(nu, sigma)
    res <- c(mu=digamma(gamma["a"]) - log(gamma["b"]), sigma=sqrt(psigamma(gamma["a"],1)))
    names(res) <- c("mu", "sigma")
    res
}

dlogvar <- function(z, nu, sigma, log=FALSE) {
    ga <- var2gamma(nu, sigma)
    dlogGamma(z, ga["a"], ga["b"], log=log)
}

qlogvar <- function(p, nu, sigma) {
    ga <- var2gamma(nu, sigma)
    VqgammaLog(p, ga["a"], ga["b"])
}
Vqlogvar <- Vectorize(qlogvar)

qlogvarApprox <- function(p, nu, sigma) {
    ga <- var2logNormal(nu, sigma)
    qnorm(p, ga["mu"], ga["sigma"])
}
VqlogvarApprox <- Vectorize(qlogvarApprox)

compare_quantiles <- function(nuLow, nuHigh, sigma, quants) {
    q1 <- quants[1]
    yv <- c(Vqlogvar(quants, nuHigh, sigma), Vqlogvar(quants, nuLow, sigma))
    ymax <- max(yv)
    ymin <- min(yv)
    qtext <- paste("quantiles:", paste(quants, collapse=", "))
    curve(Vqlogvar(q1, x, sigma), nuLow, nuHigh, ylim=c(ymin, ymax), ylab="log(sigma^2)", xlab="Sample Size nu")
    curve(VqlogvarApprox(q1, x, sigma), add=TRUE, lty=2)
    for(q in quants[-1]) {
        curve(Vqlogvar(q, x, sigma), add=TRUE)
        curve(VqlogvarApprox(q, x, sigma), add=TRUE, lty=2)
    }
    title(paste0("Log-Gamma (solid) vs Normal Approx (dashed)\nsigma=", sigma, "; ", qtext))
}

compare_quantiles(10, 100, 1, c(0.025, 0.5, 0.975))
compare_quantiles(10, 100, 10, c(0.025, 0.5, 0.975))

## calculate the KL distance of the approximation to the exact
## distribution using quadrature integration
kl_distance <- function(nu, sigma) {
    ln <- var2logNormal(nu, sigma)
    ga <- var2gamma(nu, sigma)
    lims <- log(qgamma(c(1E-5, 1-1E-5), ga["a"], ga["b"]))
    kl <- integrate(function(z) dlogvar(z, nu, sigma) * (dlogvar(z, nu, sigma, log=TRUE) - dnorm(z, ln["mu"], ln["sigma"], log=TRUE)), lims[1], lims[2])$value
    ## this transform is needed to let the scale represent in a
    ## physical sense distance, see PC priors paper from Daniel
    ## Simpson et al.
    sqrt(2 * kl)
}
Vkl_distance <- Vectorize(kl_distance)

compare_densities <- function(nu, sigma) {
    ln <- var2logNormal(nu, sigma)
    low <- qnorm(1E-5, ln["mu"], ln["sigma"])
    high <- qnorm(1-1E-5, ln["mu"], ln["sigma"])
    ##curve(dlogvar(x, nu, sigma), low, high, axes=FALSE, frame.plot=TRUE, xlab="", ylab="", xaxt='n', yaxt='n')
    ##curve(dnorm(x, ln["mu"], ln["sigma"]), add=TRUE, lty=2)
    ##title(paste0("LogGamma (solid) vs Normal Approx (dashed)\nsigma=", sigma, ", nu=", nu))
    ggplot(data.frame(x=c(low,high)), aes(x)) +
        stat_function(fun=dlogvar, args=list(nu=nu, sigma=sigma), linetype=1) +
            stat_function(fun=dnorm, args=list(mean=ln["mu"], sd=ln["sigma"]), linetype=2) +
                ggtitle(paste0("sigma=", sigma, ", nu=", nu), "Log-Gamma (solid) vs Normal Approx (dashed)") + xlab(NULL) + ylab(NULL)
}


pl1 <- compare_densities(10, 1)
pl2 <- compare_densities(20, 1)
pl3 <- compare_densities(10, 10)
pl4 <- compare_densities(20, 10)
bayesplot_grid(pl1, pl2, pl3, pl4)

ggplot(data.frame(nu=c(10, 100)), aes(nu)) +
    stat_function(fun=Vkl_distance, args=list(sigma=1)) +
        ylab("KLD(LogGamma||NormalApprox)") +
            ggtitle("KL Distance of approximate to exact distribution") +
                scale_y_continuous(breaks=seq(0.05,0.25,by=0.025))


## ------------------------------------------------------------------------
sessionInfo()

