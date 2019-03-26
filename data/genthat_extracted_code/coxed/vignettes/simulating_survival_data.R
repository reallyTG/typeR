## ----lib, message=FALSE, warning=FALSE-----------------------------------
library(coxed)

## ----simsurv1------------------------------------------------------------
simdata <- sim.survdata(N=1000, T=100, num.data.frames=1)

## ----simatt--------------------------------------------------------------
attributes(simdata)

## ----data----------------------------------------------------------------
head(simdata$data, 10)

## ----xdata---------------------------------------------------------------
head(simdata$xdata, 10)

## ----baseline------------------------------------------------------------
head(simdata$baseline, 10)

## ----beta----------------------------------------------------------------
simdata$betas

## ----cox1----------------------------------------------------------------
model <- coxph(Surv(y, failed) ~ X1 + X2 + X3, data=simdata$data)
model$coefficients

## ----expxb---------------------------------------------------------------
head(cbind(simdata$xb, simdata$exp.xb))

## ----ind1----------------------------------------------------------------
simdata$ind.survive[1,]

## ----simsurv10, cache=TRUE-----------------------------------------------
simdata <- sim.survdata(N=1000, T=100, num.data.frames=2)
summary(simdata)

## ----data3---------------------------------------------------------------
head(simdata[[2]]$data, 10)

## ----plot1, fig.align="center", fig.width=6, fig.height=4----------------
survsim.plot(simdata, df=1, type="baseline")

## ----plot2, fig.align="center", fig.width=7, fig.height=3----------------
survsim.plot(simdata, df=1, type="hist")

## ----plot3, fig.align="center", fig.width=7, fig.height=7----------------
survsim.plot(simdata, df=1, type="both")

## ----simdata3------------------------------------------------------------
simdata <- sim.survdata(N=700, T=250, xvars=5, censor=.2, num.data.frames = 1)
summary(simdata$data)

## ----simsurv1part2-------------------------------------------------------
simdata <- sim.survdata(N=1000, T=100, num.data.frames=1, beta=c(1, -1.5, 2))
simdata$betas

## ----mv------------------------------------------------------------------
summary(martinvanberg)

## ----userdata------------------------------------------------------------
mv.data <- dplyr::select(martinvanberg, postel, rgovm, pgovno)
simdata <- sim.survdata(T=100, X=mv.data, num.data.frames = 1)

## ----userdata2-----------------------------------------------------------
head(simdata$data)

## ----simsurv2------------------------------------------------------------
simdata <- sim.survdata(N=1000, T=100, num.data.frames=1, covariate=1, low=0, high=1, 
                        beta = c(2, .1, .1))

## ----me------------------------------------------------------------------
simdata$marg.effect

## ----medata--------------------------------------------------------------
head(simdata$marg.effect.data$low$x)
head(simdata$marg.effect.data$low$y)
head(simdata$marg.effect.data$high$x)
head(simdata$marg.effect.data$high$y)

## ----fixhaz1, fig.align="center", fig.width=6, fig.height=4--------------
simdata <- sim.survdata(N=1000, T=100, num.data.frames=2, fixed.hazard=TRUE)
survsim.plot(simdata, df=1, type="baseline")
survsim.plot(simdata, df=2, type="baseline")

## ----fixhaz2, fig.align="center", fig.width=6, fig.height=4--------------
simdata <- sim.survdata(N=1000, T=100, num.data.frames=2, fixed.hazard=FALSE)
survsim.plot(simdata, df=1, type="baseline")
survsim.plot(simdata, df=2, type="baseline")

## ----censorx1------------------------------------------------------------
simdata <- sim.survdata(N=1000, T=100, num.data.frames=1, censor.cond=FALSE)
logit <- glm(failed ~ X1 + X2 + X3, data=simdata$data, family=binomial(link="logit"))
summary(logit)

## ----censorx2------------------------------------------------------------
simdata <- sim.survdata(N=1000, T=100, num.data.frames=1, censor.cond=TRUE)
logit <- glm(failed ~ X1 + X2 + X3, data=simdata$data, family=binomial(link="logit"))
summary(logit)

## ----myhaz---------------------------------------------------------------
my.hazard <- function(t){ 
     dnorm((log(t) - log(50))/log(10)) /
          (log(10)*t*(1 - pnorm((log(t) - log(50))/log(10))))
     }

## ----myhazsim------------------------------------------------------------
simdata <- sim.survdata(N=1000, T=100, num.data.frames=1, hazard.fun = my.hazard)

## ----myhazplot, fig.align="center", fig.width=6, fig.height=4------------
survsim.plot(simdata, df=1, type="baseline")

## ----tvc1----------------------------------------------------------------
simdata <- sim.survdata(N=1000, T=100, type="tvc", num.data.frames=1)
head(simdata$data, 20)

## ----tvbeta--------------------------------------------------------------
simdata <- sim.survdata(N=1000, T=100, type="tvbeta", num.data.frames = 1)

## ----tvbetamat-----------------------------------------------------------
head(simdata$betas, 10)

## ----makecoef------------------------------------------------------------
beta.mat <- data.frame(beta1 = (1:100 - 25)^2/2500,
                       beta2 = .5,
                       beta3 = -.25)
head(beta.mat)

## ----tvbeta2-------------------------------------------------------------
simdata <- sim.survdata(N=1000, T=100, type="tvbeta", beta=beta.mat, num.data.frames = 1)

## ----tvbeta3-------------------------------------------------------------
head(simdata$data, 10) 

## ----tvbeta4-------------------------------------------------------------
head(simdata$betas, 10) 

