## ---- out.width = "100%", results='hide', include=F----------------------
knitr::include_graphics("BaTFLED_model.png")

## ----setup, include=F----------------------------------------------------
# Setting global options
knitr::opts_chunk$set(echo = TRUE)

## ----install packages, message=F, warning=F, results='hide'--------------
library(BaTFLED3D)

# Set up backend for parallel execution
cores <- 1
if(.Platform$OS.type == "windows") {
  clust <- parallel::makeCluster(cores)
  doParallel::registerDoParallel(clust)
} else doMC::registerDoMC(cores)

## ----generate toy data---------------------------------------------------
args <- list('decomp=Tucker',             # Should be either CP or Tucker factorization
             'm1.rows=20', 'm1.cols=80',  # Dimensions of input matrices
             'm2.rows=25', 'm2.cols=100',
             'm3.rows=5', 'm3.cols=0',
             'A1.intercept=T',            # Add intercepts to projection matrices
             'A2.intercept=T', 
             'A3.intercept=F',
             'H1.intercept=T',            # Add intercepts to latent matrices
             'H2.intercept=T', 
             'H3.intercept=T',
             'm1.true=8',                 # Number of predictors affecting output 
             'm2.true=10', 
             'm3.true=0',
             'R1=4', 'R2=4', 'R3=4',      # Core dimension
             'core.spar=0.5',             # Amount of sparsity in the core [0-1], 1=no sparsity
             'noise.sd=0.2'               # Amount of Gaussian noise added to responses
)
data.params <- get_data_params(args)
toy <- mk_toy(data.params)

## ----mode 1 mats, fig.align='center', fig.width = 6, fig.height=4--------
par(mfrow=c(2,2), mar=c(2,2,2,2), mgp=c(1,1,1))
im_mat(toy$mode1.X, main='Mode 1 X', ylab='Samples', xlab='Predictors')
im_mat(toy$mode1.A, main='Mode 1 A', ylab='Predictors', xlab='Latent factors')
im_mat(toy$mode1.H, main='Mode 1 H', ylab='Samples', xlab='Constant + latent factors')
im_mat(toy$resp[,,1], main='Slice of response tensor',
       xlab='Mode 2 samples', ylab='Mode 1 samples')

## ----making train.data---------------------------------------------------
train.data <- input_data$new(
  mode1.X=toy$mode1.X[-c(1,2), !grepl('const', colnames(toy$mode1.X))],
  mode2.X=toy$mode2.X[-c(1,2), !grepl('const', colnames(toy$mode2.X))],
  mode3.X=toy$mode3.X[, !grepl('const', colnames(toy$mode3.X))],
  resp=toy$resp[-c(1,2),-c(1,2),])

# Remove 'warm.per' percent of responses to be used as 'warm' test data
warm.per <- 0.05
warm.idx <- sample(1:prod(dim(train.data$resp)), prod(dim(train.data$resp))*warm.per)
warm.resp <- train.data$resp[sort(warm.idx)]
train.data$resp[warm.idx] <- NA
train.data$delta[warm.idx] <- 0

m1.test.data <- input_data$new(
  mode1.X=toy$mode1.X[c(1,2), !grepl('const', colnames(toy$mode1.X))],
  mode2.X=toy$mode2.X[-c(1,2), !grepl('const', colnames(toy$mode2.X))],
  mode3.X=toy$mode3.X[, !grepl('const', colnames(toy$mode3.X))],
  resp=toy$resp[c(1,2),-c(1,2),])
m2.test.data <- input_data$new(
  mode1.X=toy$mode1.X[-c(1,2), !grepl('const', colnames(toy$mode1.X))],
  mode2.X=toy$mode2.X[c(1,2), !grepl('const', colnames(toy$mode2.X))],
  mode3.X=toy$mode3.X[, !grepl('const', colnames(toy$mode3.X))],
  resp=toy$resp[-c(1,2),c(1,2),])
m1m2.test.data <- input_data$new(
  mode1.X=toy$mode1.X[c(1,2), !grepl('const', colnames(toy$mode1.X))],
  mode2.X=toy$mode2.X[c(1,2), !grepl('const', colnames(toy$mode2.X))],
  mode3.X=toy$mode3.X[, !grepl('const', colnames(toy$mode3.X))],
  resp=toy$resp[c(1,2),c(1,2),])

## ----make model----------------------------------------------------------
args <- list('decomp=Tucker', 'row.share=T',
             'A1.intercept=T', 'A2.intercept=T', 'A3.intercept=F',
             'H1.intercept=T', 'H2.intercept=T', 'H3.intercept=T',
             'plot=F', 'verbose=F',
             'R1=4', 'R2=4', 'R3=4',
             'sigma2=auto',
             'm1.alpha=1e-10', 'm2.alpha=1e-10', 'm3.alpha=1',
             'm1.beta=1e10', 'm2.beta=1e10', 'm3.beta=1',
             'core.0D.alpha=1', 'core.0D.beta=1', 
             'core.1D.alpha=1e-4', 'core.1D.beta=1e4',
             'core.2D.alpha=1e-8', 'core.2D.beta=1e8',
             'core.3D.alpha=1e-12', 'core.3D.beta=1e12',
             'parallel=T', 'cores=1', 'lower.bnd=T', 
             'update.order=c(3,1,2)', 'show.mode=c(1,2,3)')
model.params <- get_model_params(args)
model <- mk_model(train.data, model.params)
model$rand_init(model.params)

## ----image model, fig.align='center', fig.width = 6, fig.height=4--------
par(mfrow=c(2,2), mar=c(2,2,2,2), mgp=c(1,0,5))
im_mat(model$mode1.A.mean, main='Mode 1 A mean', xlab='Latent factors', ylab='Predictors')
im_mat(model$mode2.A.mean, main='Mode 2 A mean', xlab='Latent factors', ylab='Predictors')
im_mat(model$mode3.H.mean, main='Mode 3 H mean', xlab='Latent factors', ylab='Samples')
if(model.params$decomp=='Tucker')
  im_mat(model$core.mean[,,1], main='Core mean', xlab='mode 2 latent', ylab='Mode 1 latent')

## ----train model, message=F, warning=F, results='hide', fig.show='hide'----
reps <- 5

# Data frame to store RMSEs & explained variances for test data while training 
test.results <- numeric(0)

trained <- model$clone()

for(i in 1:reps) {
train(d=train.data, m=trained, params=model.params)

# Get cold results
test.results <- test_results(m=trained, d=train.data, test.results=test.results,
warm.resp=warm.resp, test.m1=m1.test.data, test.m2=m2.test.data, 
test.m1m2=m1m2.test.data)
}

# Stop cluster (if using parallel package)
if(.Platform$OS.type == "windows") parallel::stopCluster(clust)

## ----compare model matrices, results='hide', fig.align='center', fig.width = 6, fig.height=4----
par(mfrow=c(3,4), mar=c(2,2,2,2))
im_2_mat(toy$mode1.A, trained$mode1.A.mean, main1='Mode 1 A true', main2='Mode 1 A learned')
m1.H.order <- im_2_mat(toy$mode1.H[-(1:2),], trained$mode1.H.mean, 
                       main1='Mode 1 H true', main2='Mode 1 H learned')
im_2_mat(toy$mode2.A, trained$mode2.A.mean, main1='Mode 2 A true', main2='Mode 2 A learned')
m2.H.order <- im_2_mat(toy$mode2.H[-(1:2),], trained$mode2.H.mean, 
                       main1='Mode 2 H true', main2='Mode 2 H learned')
m3.H.order <- im_2_mat(toy$mode3.H, trained$mode3.H.mean, 
                       main1='Mode 3 H true', main2='Mode 3 H learned')
if(model.params$decomp=='Tucker') {
  core.reorder <- trained$core.mean[abs(m1.H.order), abs(m2.H.order), abs(m3.H.order)]
  core.reorder <- core.reorder * outer(sign(m1.H.order), outer(sign(m2.H.order), sign(m3.H.order)))
  im_2_mat(toy$core[,,1], core.reorder[,,1], sort=F, center=T, scale='all',
           main1='Core slice true', main2='Core slice learned')
}

## ----ROC curves, message=FALSE, warning=FALSE, fig.align='center', results='hide', fig.width = 6, fig.height=4----
par(mfrow=c(1,2), mar=c(3,3,2,2), mgp=c(2,1,0))
plot_roc(toy$mode1.A, trained$mode1.A.mean, main='Mode 1')
plot_roc(toy$mode2.A, trained$mode2.A.mean, main='Mode 2')

## ----training measures, fig.align='center', fig.width = 6, fig.height=4----
par(mfrow=c(2,2), mar=c(3,3,2,2), mgp=c(2,1,0))
if(model.params$lower.bnd) plot(trained$lower.bnd, main='Lower bound')
if(model.params$RMSE)      plot(trained$RMSE, main='Training RMSE')
if(model.params$exp.var)   plot(trained$exp.var, main='Training explained variation')
if(model.params$cor)       plot(trained$s.cor, main='Spearman correlation')

## ---- fig.align='center', fig.width = 6, fig.height=6--------------------
par(mfrow=c(2,2))
plot_test_RMSE(test.results, main="Test RMSEs")
plot_test_exp_var(test.results, main="Test explained variances")
plot_test_cor(test.results, main="Pearson correlation")
plot_test_cor(test.results, main="Spearman correlation", method='spearman')

