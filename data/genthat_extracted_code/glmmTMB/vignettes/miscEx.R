## ----echo=FALSE----------------------------------------------------------
library(glmmTMB)

## ----simbeta1------------------------------------------------------------
set.seed(1001)
N <- 1000
mean_pars <- c(1,2)
disp_pars <- c(1,2)
dd <- data.frame(x=rnorm(N))
m <- plogis(mean_pars[1]+mean_pars[2]*dd$x)
d <- exp(disp_pars[1]+disp_pars[2]*dd$x)
dd$y <- rbeta(N,shape1=m*d,shape2=(1-m)*d)

## ----modbeta1------------------------------------------------------------
## location only
m1 <- glmmTMB(y~x,
              family=beta_family(),
              data=dd)
## add model for dispersion
m2 <- update(m1,dispformula=~x)

## ----coefbeta1-----------------------------------------------------------
fixef(m2)

## ----AICbeta1------------------------------------------------------------
bbmle::AICtab(m1,m2)

