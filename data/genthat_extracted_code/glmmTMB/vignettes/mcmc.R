## ----knitr_setup, include=FALSE, message=FALSE---------------------------
library(knitr)
opts_chunk$set(echo = TRUE)
rc <- knitr::read_chunk
rc(system.file("vignette_data","mcmc.R",package="glmmTMB"))

## ----libs,message=FALSE--------------------------------------------------
library(glmmTMB)
library(coda)     ## MCMC utilities
library(reshape2) ## for melt()
## graphics
library(lattice)
library(ggplot2); theme_set(theme_bw())

## ----fit1----------------------------------------------------------------
data("sleepstudy",package="lme4")
fm1 <- glmmTMB(Reaction ~ Days + (Days|Subject),
               sleepstudy)

## ----setup---------------------------------------------------------------
## FIXME: is there a better way for user to extract full coefs?
rawcoef <- with(fm1$obj$env,last.par[-random])
names(rawcoef) <- make.names(names(rawcoef),unique=TRUE)
## log-likelihood function 
## (MCMCmetrop1R wants *positive* log-lik)
logpost_fun <- function(x) -fm1$obj$fn(x)
## check definitions
stopifnot(all.equal(c(logpost_fun(rawcoef)),
                    c(logLik(fm1)),
          tolerance=1e-7))
V <- vcov(fm1,full=TRUE)

## ----run_MCMC------------------------------------------------------------
##' @param start starting value
##' @param V variance-covariance matrix of MVN candidate distribution
##' @param iterations total iterations
##' @param nsamp number of samples to store
##' @param burnin number of initial samples to discard
##' @param thin thinning interval
##' @param tune tuning parameters; expand/contract V
##' @param seed random-number seed
run_MCMC <- function(start,
                     V,   
                     logpost_fun,
                     iterations = 10000,
                     nsamp = 1000,
                     burnin = iterations/2,
                     thin = floor((iterations-burnin)/nsamp),
                     tune = NULL,
                     seed=NULL
                     ) {
    ## initialize
    if (!is.null(seed)) set.seed(seed)
    if (!is.null(tune)) {
        tunesq <- if (length(tune)==1) tune^2 else outer(tune,tune)
        V <-  V*tunesq
    }
    chain <- matrix(NA, nsamp+1, length(start))
    chain[1,] <- cur_par <- start
    postval <- logpost_fun(cur_par)
    j <- 1
    for (i in 1:iterations) {
        proposal = MASS::mvrnorm(1,mu=cur_par, Sigma=V)
        newpostval <- logpost_fun(proposal)
        accept_prob <- exp(newpostval - postval)
        if (runif(1) < accept_prob) {
            cur_par <- proposal
            postval <- newpostval
        }
        if ((i>burnin) && (i %% thin == 1)) {
            chain[j+1,] <- cur_par
            j <- j + 1
        }
    }
    chain <- na.omit(chain)
    colnames(chain) <- names(start)
    chain <- coda::mcmc(chain)
    return(chain)
}

## ----do_run_MCMC,eval=FALSE----------------------------------------------
#  t1 <- system.time(m1 <- run_MCMC(start=rawcoef,
#                                   V=V, logpost_fun=logpost_fun,
#                                   seed=1001))

## ----load_MCMC, echo=FALSE-----------------------------------------------
L <- load(system.file("vignette_data", "mcmc.rda", package="glmmTMB"))

## ----add_names-----------------------------------------------------------
colnames(m1) <- c(names(fixef(fm1)[[1]]),
                  "log(sigma)",
                  c("log(sd_Intercept)","log(sd_Days)","cor"))
m1[,"cor"] <- sapply(m1[,"cor"],get_cor)

## ----traceplot,fig.width=7-----------------------------------------------
xyplot(m1,layout=c(2,3),asp="fill")

## ----effsize-------------------------------------------------------------
print(effectiveSize(m1),digits=3)

## ----violins,echo=FALSE--------------------------------------------------
ggplot(reshape2::melt(as.matrix(m1[,-1])),aes(x=Var2,y=value))+
         geom_violin(fill="gray")+coord_flip()+labs(x="")

## ----do_tmbstan,eval=FALSE-----------------------------------------------
#  ## install.packages("tmbstan")
#  library(tmbstan)
#  t2 <- system.time(m2 <- tmbstan(fm1$obj))

## ----show_traceplot,echo=FALSE,fig.width=8,fig.height=5------------------
library(png)
library(grid)
img <- readPNG(system.file("vignette_data","tmbstan_traceplot.png",package="glmmTMB"))
grid.raster(img)

