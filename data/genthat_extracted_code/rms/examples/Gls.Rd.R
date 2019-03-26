library(rms)


### Name: Gls
### Title: Fit Linear Model Using Generalized Least Squares
### Aliases: Gls print.Gls
### Keywords: models

### ** Examples

## Not run: 
##D ns  <- 20  # no. subjects
##D nt  <- 10  # no. time points/subject
##D B   <- 10  # no. bootstrap resamples
##D            # usually do 100 for variances, 1000 for nonparametric CLs
##D rho <- .5  # AR(1) correlation parameter
##D V <- matrix(0, nrow=nt, ncol=nt)
##D V <- rho^abs(row(V)-col(V))   # per-subject correlation/covariance matrix
##D 
##D d <- expand.grid(tim=1:nt, id=1:ns)
##D d$trt <- factor(ifelse(d$id <= ns/2, 'a', 'b'))
##D true.beta <- c(Intercept=0,tim=.1,'tim^2'=0,'trt=b'=1)
##D d$ey  <- true.beta['Intercept'] + true.beta['tim']*d$tim +
##D   true.beta['tim^2']*(d$tim^2) +  true.beta['trt=b']*(d$trt=='b')
##D set.seed(13)
##D library(MASS)   # needed for mvrnorm
##D d$y <- d$ey + as.vector(t(mvrnorm(n=ns, mu=rep(0,nt), Sigma=V)))
##D 
##D dd <- datadist(d); options(datadist='dd')
##D f <- Gls(y ~ pol(tim,2) + trt, correlation=corCAR1(form= ~tim | id),
##D          data=d, B=B)
##D f
##D AIC(f)
##D f$var      # bootstrap variances
##D f$varBeta  # original variances
##D summary(f)
##D anova(f)
##D ggplot(Predict(f, tim, trt))
##D # v <- Variogram(f, form=~tim|id, data=d)
##D nlme:::summary.gls(f)$tTable   # print matrix of estimates etc.
##D 
##D options(datadist=NULL)
## End(Not run)



