## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
rm(list=ls()) ; set.seed(42)
library(pgsc)

### Parameters
NN <- 15                    # Number of units
TT <- 50                    # Number of periods
MM <- 2                     # Number of treatments
RR <- 3                     # Number of covariates
SS <- 2                     # Number of unit FEs
QQ <- 3                     # Number of time FEs
b <- c(1,2)                 # Treatment coefficients
sq <- matrix( c( 1, .2, .3, -.9, -.1, .2 ), nrow=SS, ncol=QQ )
                            # Weighting matrix on time-varying factors
p <- t( matrix(c( -1, 0, .2, .5, .2, 0), nrow=MM, ncol=RR ) )
                            # The covariance of X and D
r <- .1 * c( .5, 1, 2)      # Coefficient on observed covariates
sig <- .2                   # Noise sd
sig.y <- 5                  # Unit FEs
sig.t <- 4                  # Time FE noise

### Data
set.seed(42)
fes <- matrix( rnorm(NN * SS, 0, sig.y), NN, SS )    # Unit fixed effects
tfes <- matrix( rnorm(TT * QQ, 0, sig.t ), TT, QQ )  # Time fixed effects
X <- array( rnorm(NN*RR*TT), c( NN, RR, TT ))        # Covariates
D <- array(NA, dim=c( NN, MM, TT ))
D[] <- apply(X, 3, function(x) x%*%p)
D <- D + array( rnorm(NN*MM*TT), c( NN, MM, TT ))               # Treatments, correl. w/ X
Y <- sapply( 1:TT, function(i) D[,,i] %*% b + X[,,i] %*% r ) +  # Treatment & covariates
  fes[,1] + rep(1,NN) %*% t(tfes[,1]) +                         # FEs and TFE
  fes %*% sq %*% t(tfes) +                                      # Time-unit interaction
  rnorm( NN*TT, 0, sig )                                        # Noise
pgsc.dta <- data.frame( n=state.abb[1:NN], t=rep(1:TT,each=NN), y=c(Y),
                   do.call(rbind,lapply(1:TT,function(i)D[,,i])),
                   do.call(rbind,lapply(1:TT,function(i)X[,,i])) )
names(pgsc.dta) <- c('n','t','y', paste0('D',1:MM), paste0('X',1:RR) )
    # Bind into a data frame

## ------------------------------------------------------------------------

### Panel regression
library(plm)
pan <- plm( y ~ D1 + D2 + X1 + X2 + X3, pgsc.dta, effect = 'twoways', index = c('n','t'))
summary(pan)

## ------------------------------------------------------------------------

### Panel regression
library(plm)
pgsc.dta.copy <- pgsc.dta
pgsc.dta.copy$ov <- c(fes %*% sq %*% t(tfes)) * 2 + rnorm(NN*TT) * 3
pan.2 <- plm( y ~ D1 + D2 + X1 + X2 + X3 + ov, pgsc.dta.copy, effect = 'twoways', index = c('n','t'))
summary(pan.2)

## ------------------------------------------------------------------------

### Compute the point estimate
wt.init <- matrix( 1 / (NN-1), NN, NN-2 )
b.init <- pan$coefficients[c('D1','D2')]
sol.it <- pgsc(pgsc.dta, dep.var = 'y', indep.var = c('D1','D2'), b.init = b.init,
                      method='onestep')
summary(sol.it)

## ------------------------------------------------------------------------

### Compute point estimates from the two-step estimators
sol.2.step.aggte <- pgsc(pgsc.dta, dep.var = 'y', indep.var = c('D1','D2'),
                                b.init = sol.it$b, method='twostep.aggte',
                                print.level=-1)
sol.2.step.indiv <- pgsc(pgsc.dta, dep.var = 'y', indep.var = c('D1','D2'),
                                b.init = sol.2.step.aggte$b, method='twostep.indiv',
                                print.level=-2)
sol.compare <- rbind( pan$coefficients[c('D1','D2')], sol.it$b, sol.2.step.aggte$b,
                      sol.2.step.indiv$b, b )
rownames(sol.compare) <- c( 'Panel FEs', 'GSC onestep', 'Aggte two-step GSC',
                            'Indiv two-step GSC', 'Truth')
print(sol.compare)

## ------------------------------------------------------------------------
A <- - 1
g <- function(b) b[1] / ( 1 - b[2] ) - A
g.grad <- function(b) c( 1 / ( 1 - b[2] ), b[1] / ( 1 - b[2] )^2 )

## ------------------------------------------------------------------------
sol.2.step.rest <- pgsc(pgsc.dta, dep.var = 'y', indep.var = c('D1','D2'), b.init = b.init,
                      method='twostep.indiv', g.i=g, g.i.grad=g.grad )
wald.test.g <- pgsc.wald.test( pgsc.dta, dep.var = 'y', indep.var = c('D1','D2'),
                                 sol.rest = sol.2.step.rest, n.boot = 10000 )

## ------------------------------------------------------------------------
summary(wald.test.g)
plot(wald.test.g)

## ----include=FALSE-------------------------------------------------------
A <- 2
sol.2.step.rest.2 <- pgsc(pgsc.dta, dep.var = 'y', indep.var = c('D1','D2'), b.init = b.init,
                      method='twostep.indiv', g.i=g, g.i.grad=g.grad )
wald.test.g.2 <- pgsc.wald.test( pgsc.dta, dep.var = 'y', indep.var = c('D1','D2'),
                                 sol.rest = sol.2.step.rest.2, n.boot = 10000 )

## ------------------------------------------------------------------------
summary(wald.test.g.2)
plot(wald.test.g.2)

