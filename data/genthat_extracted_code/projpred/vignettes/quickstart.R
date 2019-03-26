params <-
structure(list(EVAL = FALSE), .Names = "EVAL")

## ---- SETTINGS-knitr, include=FALSE--------------------------------------
stopifnot(require(knitr))
knitr::opts_chunk$set(
    fig.width = 7, fig.height = 5
)

## ---- results='hide', message=F, warning=F-------------------------------
library(rstanarm)
library(projpred)
library(ggplot2)
library(bayesplot)
theme_set(theme_classic())
#options(mc.cores = parallel::detectCores())

## ------------------------------------------------------------------------
data('df_gaussian', package = 'projpred')

## ---- results='hide', message=F, warning=F, cache=T----------------------
n <- nrow(df_gaussian$x) # 100
D <- ncol(df_gaussian$x) # 20
p0 <- 5 # prior guess for the number of relevant variables
tau0 <- p0/(D-p0) * 1/sqrt(n) # scale for tau (notice that stan_glm will automatically scale this by sigma)
prior_coeff <- hs(global_scale = tau0, slab_scale = 1) # regularized horseshoe prior
fit <- stan_glm(y ~ x, family=gaussian(), data=df_gaussian, prior=prior_coeff,
                # to make this vignette build fast, we use only 2 chains and
                # 500 draws. In practice, more conservative values, eg. 4 chains
                # and 2000 draws might be required for reliable inference.
                seed=1, chains=2, iter=500) 


## ------------------------------------------------------------------------
vs <- varsel(fit, method='forward')
vs$vind # variables ordered as they enter during the search

## ---- fig.width=5, fig.height=4------------------------------------------
# plot predictive performance on training data 
varsel_plot(vs, stats=c('elpd', 'rmse'))

## ---- results='hide', warning=F, cache=T---------------------------------
cvs <- cv_varsel(fit, method='forward')

## ------------------------------------------------------------------------
# model size suggested by the program
suggest_size(cvs)

## ---- fig.width=5, fig.height=4------------------------------------------
# plot the validation results, this time relative to the full model
varsel_plot(cvs, stats = c('elpd', 'rmse'), deltas=T)

## ---- fig.width=6, fig.height=2------------------------------------------
# Visualise the three most relevant variables in the full model
mcmc_areas(as.matrix(fit), 
           pars = c('(Intercept)', names(vs$vind[1:3]), 'sigma')) + coord_cartesian(xlim = c(-2, 2))

## ---- fig.width=6, fig.height=2------------------------------------------
# Visualise the projected three most relevant variables
proj <- project(vs, nv = 3, ns = 500)
mcmc_areas(as.matrix(proj)) + coord_cartesian(xlim = c(-2, 2))

## ------------------------------------------------------------------------
pred <- proj_linpred(vs, xnew=df_gaussian$x, ynew=df_gaussian$y, nv = 6, integrated = TRUE)

## ---- fig.width=5, fig.height=3------------------------------------------
ggplot() +
  geom_point(aes(x=pred$pred,y=df_gaussian$y)) +
  geom_abline(slope = 1, color='red') +
  labs(x = 'prediction', y = 'y')

## ---- fig.height=3, fig.width=5------------------------------------------
y1_rep <- proj_predict(vs, xnew=df_gaussian$x[1,,drop=F], nv=6, seed=7560)
qplot(as.vector(y1_rep), bins=25) +
  geom_vline(xintercept = df_gaussian$y[1], color='red') +
  xlab('y1_rep')

## ------------------------------------------------------------------------
data('df_binom', package = 'projpred')

## ---- results='hide', message=F, warning=F, cache=T----------------------
# fit the full model
n <- nrow(df_binom$x)
D <- ncol(df_binom$x)
p0 <- 5 # prior guess for the number of relevant variables
sigma <- 2 # approximate plug-in value for observation information (Piironen and Vehtari, 2017b)
tau0 <- p0/(D-p0) * sigma/sqrt(n)
prior_coeff <- hs(global_scale = tau0, slab_scale = 1)
fit <- stan_glm(y ~ x, family=binomial(), data=df_binom, prior=prior_coeff,
                seed=1, chains=2, iter=500)

## ------------------------------------------------------------------------
vs <- varsel(fit, method='forward')
vs$vind

## ---- fig.width=5, fig.height=4------------------------------------------
varsel_plot(vs, stats=c('elpd', 'acc'), deltas=F)

## ---- results='hide', warning=F, cache=T---------------------------------
cvs <- cv_varsel(fit, method='forward', cv_method='kfold', K=3, seed=823217)

## ------------------------------------------------------------------------
# model size suggested by the program
suggest_size(cvs)

## ---- fig.width=5, fig.height=4------------------------------------------
# plot the validation results
varsel_plot(cvs, stats=c('elpd', 'acc'))

## ---- fig.height=3.5, fig.width=5----------------------------------------
# evaluate the predictive distribution in a 2d grid
ng <- 20
x1g <- seq(-4,4,len=ng)
x2g <- seq(-4,4,len=ng)
xnew <- cbind( rep(x1g,each=ng), rep(x2g,ng) )
vind <- vs$vind[1:2]
pr <- proj_linpred(vs, xnew, vind=vind, transform=T, integrated=T)

# visualize the contours showing the predicted class probabilities
pp <- ggplot()
pp <- pp + geom_contour(aes(x=xnew[,1],y=xnew[,2], z=pr, colour=..level..))
pp <- pp + scale_colour_gradient(low = "red", high = "green")
pp <- pp + geom_point(aes(x=df_binom$x[,vind[1]],y=df_binom$x[,vind[2]]), color=df_binom$y+2)
pp <- pp + xlab(sprintf('Feature %d',vind[1])) + ylab(sprintf('Feature %d',vind[2]))
pp

## ------------------------------------------------------------------------
set.seed(324092)
n <- 100 # number of observations
d <- 200 # number of features
rho <- 0.5 # correlation between the features
f <- rnorm(n) # the true underlying function
x <- sqrt(1-rho)*matrix(rnorm(n*d), ncol=d) + sqrt(rho)*f # features are noisy observations from f
y <- f + rnorm(n) # target variable

## ---- results='hide', message=F, warning=F, cache=T----------------------
# dimension reduction
nc <- 3 # number of principal components to use
dr <- prcomp(x, rank. = nc) 
z <- dr$x

# fit the model
fit <- stan_glm(y~., data=data.frame(z,y), prior=normal(scale=2))
draws <- as.matrix(fit) # posterior draws
sigma <- draws[,'sigma'] # noise std
beta <- draws[,1+c(1:nc)] # regression coefficients
alpha <- draws[,'(Intercept)'] # intercept

## ------------------------------------------------------------------------
# prediction with the reference model
predfun <- function(zt) t( beta %*% t(zt) + alpha ) 

# initialize the reference model object. notice here that the first argument z 
# denotes the features of the reference model, and x the features from which 
# we want to select from
ref <- init_refmodel(z, y, gaussian(), x=x, predfun=predfun, dis=sigma)

## ---- fig.width=5, fig.height=4, results='hide', message=F, warning=F, cache=T----
# LOO validation for the feature selection
cvs <- cv_varsel(ref)
varsel_plot(cvs, stats=c('elpd','rmse'))

## ---- fig.width=5, fig.height=2.5, results='hide', message=F, warning=F, cache=T----
# initialize the data reference
dref <- init_refmodel(x,y,family=gaussian())
lasso <- cv_varsel(dref, K=10, method='l1', nv_max=30) # tenfold CV for Lasso
varsel_plot(lasso, stats='rmse')

## ---- fig.width=5, fig.height=2.5, results='hide', message=F, warning=F, cache=T----
fsel <- cv_varsel(dref, K=10, method='forward', regul=1)
varsel_plot(fsel, stats='rmse')

