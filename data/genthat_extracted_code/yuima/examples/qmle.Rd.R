library(yuima)


### Name: qmle
### Title: Calculate quasi-likelihood and ML estimator of least squares
###   estimator
### Aliases: qmle quasilogl rql lse pseudologlikelihood
###   pseudologlikelihood.COGARCH
### Keywords: ts

### ** Examples

#dXt^e = -theta2 * Xt^e * dt + theta1 * dWt
diff.matrix <- matrix(c("theta1"), 1, 1)
ymodel <- setModel(drift=c("(-1)*theta2*x"), diffusion=diff.matrix,
  time.variable="t", state.variable="x", solve.variable="x")
n <- 100

ysamp <- setSampling(Terminal=(n)^(1/3), n=n)
yuima <- setYuima(model=ymodel, sampling=ysamp)
set.seed(123)
yuima <- simulate(yuima, xinit=1, true.parameter=list(theta1=0.3,
theta2=0.1))
QL <- quasilogl(yuima, param=list(theta2=0.8, theta1=0.7))
##QL <- ql(yuima, 0.8, 0.7, h=1/((n)^(2/3)))
QL

## another way of parameter specification
##param <- list(theta2=0.8, theta1=0.7)
##QL <- ql(yuima, h=1/((n)^(2/3)), param=param)
##QL


## old code
##system.time(
##opt <- ml.ql(yuima, 0.8, 0.7, h=1/((n)^(2/3)), c(0, 1), c(0, 1))
##)
##cat(sprintf("\nTrue param. theta2 = .3, theta1 = .1\n"))
##print(coef(opt))


system.time(
opt2 <- qmle(yuima, start=list(theta1=0.8, theta2=0.7), lower=list(theta1=0,theta2=0),
 upper=list(theta1=1,theta2=1), method="L-BFGS-B")
)
cat(sprintf("\nTrue param. theta2 = .3, theta1 = .1\n"))
print(coef(opt2))

## initial guess for theta2 by least squares estimator
tmp <- lse(yuima, start=list(theta2=0.7), lower=list(theta2=0), upper=list(theta2=1))
tmp

system.time(
opt3 <- qmle(yuima, start=list(theta1=0.8, theta2=tmp), lower=list(theta1=0,theta2=0),
 upper=list(theta1=1,theta2=1), method="L-BFGS-B")
)
cat(sprintf("\nTrue param. theta2 = .3, theta1 = .1\n"))
print(coef(opt3))


## perform joint estimation? Non-optimal, just for didactic purposes
system.time(
opt4 <- qmle(yuima, start=list(theta1=0.8, theta2=0.7), lower=list(theta1=0,theta2=0),
 upper=list(theta1=1,theta2=1), method="L-BFGS-B", joint=TRUE)
)
cat(sprintf("\nTrue param. theta2 = .3, theta1 = .1\n"))
print(coef(opt4))

## old code
##system.time(
##opt <- ml.ql(yuima, 0.8, 0.7, h=1/((n)^(2/3)), c(0, 1), c(0, 1), method="Newton")
##)
##cat(sprintf("\nTrue param. theta2 = .3, theta1 = .1\n"))
##print(coef(opt))


## Not run: 
##D ###multidimension case
##D ##dXt^e = - drift.matrix * Xt^e * dt + diff.matrix * dWt
##D diff.matrix <- matrix(c("theta1.1","theta1.2", "1", "1"), 2, 2)
##D 
##D drift.c <- c("-theta2.1*x1", "-theta2.2*x2", "-theta2.2", "-theta2.1")
##D drift.matrix <- matrix(drift.c, 2, 2)
##D 
##D ymodel <- setModel(drift=drift.matrix, diffusion=diff.matrix, time.variable="t",
##D                    state.variable=c("x1", "x2"), solve.variable=c("x1", "x2"))
##D n <- 100
##D ysamp <- setSampling(Terminal=(n)^(1/3), n=n)
##D yuima <- setYuima(model=ymodel, sampling=ysamp)
##D set.seed(123)
##D 
##D ##xinit=c(x1, x2) #true.parameter=c(theta2.1, theta2.2, theta1.1, theta1.2)
##D yuima <- simulate(yuima, xinit=c(1, 1),
##D true.parameter=list(theta2.1=0.5, theta2.2=0.3, theta1.1=0.6, theta1.2=0.2))
##D 
##D ## theta2 <- c(0.8, 0.2) #c(theta2.1, theta2.2)
##D ##theta1 <- c(0.7, 0.1) #c(theta1.1, theta1.2)
##D ## QL <- ql(yuima, theta2, theta1, h=1/((n)^(2/3)))
##D ## QL
##D 
##D ## ## another way of parameter specification
##D ## #param <- list(theta2=theta2, theta1=theta1)
##D ## #QL <- ql(yuima, h=1/((n)^(2/3)), param=param)
##D ## #QL
##D 
##D ## theta2.1.lim <- c(0, 1)
##D ## theta2.2.lim <- c(0, 1)
##D ## theta1.1.lim <- c(0, 1)
##D ## theta1.2.lim <- c(0, 1)
##D ## theta2.lim <- t( matrix( c(theta2.1.lim, theta2.2.lim), 2, 2) )
##D ## theta1.lim <- t( matrix( c(theta1.1.lim, theta1.2.lim), 2, 2) )
##D 
##D ## system.time(
##D ## opt <- ml.ql(yuima, theta2, theta1, h=1/((n)^(2/3)), theta2.lim, theta1.lim)
##D ## )
##D ## opt@coef
##D 
##D system.time(
##D opt2 <- qmle(yuima, start=list(theta2.1=0.8, theta2.2=0.2, theta1.1=0.7, theta1.2=0.1),
##D  lower=list(theta1.1=.1,theta1.2=.1,theta2.1=.1,theta2.2=.1),
##D  upper=list(theta1.1=4,theta1.2=4,theta2.1=4,theta2.2=4), method="L-BFGS-B")
##D )
##D opt2@coef
##D summary(opt2)
##D 
##D ## unconstrained optimization
##D system.time(
##D opt3 <- qmle(yuima, start=list(theta2.1=0.8, theta2.2=0.2, theta1.1=0.7, theta1.2=0.1))
##D )
##D opt3@coef
##D summary(opt3)
##D 
##D quasilogl(yuima, param=list(theta2.1=0.8, theta2.2=0.2, theta1.1=0.7, theta1.2=0.1))
##D 
##D ##system.time(
##D ##opt <- ml.ql(yuima, theta2, theta1, h=1/((n)^(2/3)), theta2.lim, theta1.lim, method="Newton")
##D ##)
##D ##opt@coef
##D ##
##D 
##D # carma(p=2,q=0) driven by a brownian motion without location parameter
##D 
##D mod0<-setCarma(p=2,
##D                q=0,
##D                scale.par="sigma")
##D 
##D true.parm0 <-list(a1=1.39631,
##D                  a2=0.05029,
##D                  b0=1,
##D                  sigma=0.23)
##D 
##D samp0<-setSampling(Terminal=100,n=250)
##D set.seed(123)
##D sim0<-simulate(mod0,
##D                true.parameter=true.parm0,
##D                sampling=samp0)
##D 
##D system.time(
##D carmaopt0 <- qmle(sim0, start=list(a1=1.39631,a2=0.05029,
##D                               b0=1,
##D                                sigma=0.23))
##D )
##D 
##D summary(carmaopt0)
##D 
##D # carma(p=2,q=1) driven by a brownian motion without location parameter
##D 
##D mod1<-setCarma(p=2,
##D                q=1)
##D 
##D true.parm1 <-list(a1=1.39631,
##D                   a2=0.05029,
##D                   b0=1,
##D                   b1=2)
##D 
##D samp1<-setSampling(Terminal=100,n=250)
##D set.seed(123)
##D sim1<-simulate(mod1,
##D                true.parameter=true.parm1,
##D                sampling=samp1)
##D 
##D system.time(
##D   carmaopt1 <- qmle(sim1, start=list(a1=1.39631,a2=0.05029,
##D                                      b0=1,b1=2),joint=TRUE)
##D )
##D 
##D summary(carmaopt1)
##D 
##D # carma(p=2,q=1) driven by a compound poisson process where the jump size is normally distributed.
##D 
##D mod2<-setCarma(p=2,
##D                q=1,
##D                measure=list(intensity="1",df=list("dnorm(z, 0, 1)")),
##D                measure.type="CP")
##D 
##D true.parm2 <-list(a1=1.39631,
##D                   a2=0.05029,
##D                   b0=1,
##D                   b1=2)
##D 
##D samp2<-setSampling(Terminal=100,n=250)
##D set.seed(123)
##D sim2<-simulate(mod2,
##D                true.parameter=true.parm2,
##D                sampling=samp2)
##D 
##D system.time(
##D   carmaopt2 <- qmle(sim2, start=list(a1=1.39631,a2=0.05029,
##D                                      b0=1,b1=2),joint=TRUE)
##D )
##D 
##D summary(carmaopt2)
##D 
##D # carma(p=2,q=1) driven by a normal inverse gaussian process
##D mod3<-setCarma(p=2,q=1,
##D                measure=list(df=list("rNIG(z, alpha, beta, delta1, mu)")),
##D                measure.type="code")
##D #
##D 
##D # True param
##D true.param3<-list(a1=1.39631,
##D                  a2=0.05029,
##D                  b0=1,
##D                  b1=2,
##D                  alpha=1,
##D                  beta=0,
##D                  delta1=1,
##D                  mu=0)
##D 
##D samp3<-setSampling(Terminal=100,n=200)
##D set.seed(123)
##D 
##D sim3<-simulate(mod3,
##D                true.parameter=true.param3,
##D                sampling=samp3)
##D 
##D 
##D carmaopt3<-qmle(sim3,start=true.param3)
##D 
##D summary(carmaopt3)
##D 
##D # Simulation and Estimation of COGARCH(1,1) with CP driven noise
##D 
##D # Model parameters
##D eta<-0.053
##D b1 <- eta
##D beta <- 0.04
##D a0 <- beta/b1
##D phi<- 0.038
##D a1 <- phi
##D 
##D 
##D # Definition
##D 
##D cog11<-setCogarch(p = 1,q = 1,
##D   measure = list(intensity = "1",
##D                  df = list("dnorm(z, 0, 1)")),
##D   measure.type = "CP",
##D   XinExpr=TRUE)
##D 
##D # Parameter
##D paramCP11 <- list(a1 = a1, b1 =  b1,
##D                   a0 = a0, y01 = 50.31)
##D # Sampling scheme
##D samp11 <- setSampling(0, 3200, n=64000)
##D 
##D # Simulation
##D set.seed(125)
##D 
##D SimTime11 <- system.time(
##D   sim11 <- simulate(object = cog11,
##D     true.parameter = paramCP11,
##D     sampling = samp11,
##D     method="mixed")
##D )
##D 
##D plot(sim11)
##D 
##D # Estimation
##D 
##D timeComp11<-system.time(
##D   res11 <- qmle(yuima = sim11,
##D     start = paramCP11,
##D     grideq = TRUE,
##D     method = "Nelder-Mead")
##D )
##D 
##D timeComp11
##D 
##D unlist(paramCP11)
##D 
##D coef(res11)
##D 
##D # COGARCH(2,2) model driven by CP
##D 
##D cog22 <- setCogarch(p = 2,q = 2,
##D   measure = list(intensity = "1",
##D                  df = list("dnorm(z, 0, 1)")),
##D   measure.type = "CP",
##D   XinExpr=TRUE)
##D 
##D # Parameter
##D 
##D paramCP22 <- list(a1 = 0.04, a2 = 0.001,
##D   b1 =  0.705, b2 = 0.1, a0 = 0.1, y01 = (1 + 2 / 3),
##D   y02=0)
##D 
##D # Use diagnostic.cog for checking the stat and positivity
##D 
##D check22 <- Diagnostic.Cogarch(cog22, param = paramCP22)
##D 
##D # Sampling scheme
##D 
##D samp22 <- setSampling(0, 3600, n = 64000)
##D 
##D # Simulation
##D 
##D set.seed(125)
##D SimTime22 <- system.time(
##D   sim22 <- simulate(object = cog22,
##D     true.parameter = paramCP22,
##D     sampling = samp22,
##D     method = "Mixed")
##D )
##D 
##D plot(sim22)
##D 
##D timeComp22 <- system.time(
##D   res22 <- qmle(yuima = sim22,
##D     start = paramCP22,
##D     grideq=TRUE,
##D     method = "Nelder-Mead")
##D )
##D 
##D timeComp22
##D 
##D unlist(paramCP22)
##D 
##D coef(res22)
##D 
## End(Not run)



