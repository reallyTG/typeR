library(intubate)


### Name: kernlab
### Title: Interfaces for kernlab package for data science pipelines.
### Aliases: ntbt_gausspr ntbt_kfa ntbt_kha ntbt_kkmeans ntbt_kpca ntbt_kqr
###   ntbt_ksvm ntbt_lssvm ntbt_rvm ntbt_sigest ntbt_specc
### Keywords: intubate magrittr kernlab gausspr kfa kha kkmeans kpca kqr
###   ksvm lssvm rvm sigest specc

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(kernlab)
##D 
##D ##  ntbt_gausspr: Gaussian processes for regression and classification
##D data(iris)
##D 
##D ## Original function to interface
##D gausspr(Species ~ ., data = iris, var = 2)
##D 
##D ## The interface puts data as first parameter
##D ntbt_gausspr(iris, Species ~ ., var = 2)
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_gausspr(Species ~ ., var = 2)
##D 
##D 
##D ## ntbt_kfa: Kernel Feature Analysis
##D data(promotergene)
##D 
##D ## Original function to interface
##D kfa(~ ., data = promotergene)
##D 
##D ## The interface puts data as first parameter
##D ntbt_kfa(promotergene, ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D promotergene %>%
##D   ntbt_kfa(~ .)
##D 
##D 
##D ## ntbt_kha: Kernel Principal Components Analysis
##D data(iris)
##D test <- sample(1:150,70)
##D 
##D ## Original function to interface
##D kpc <- kha(~ ., data = iris[-test, -5], kernel = "rbfdot", kpar = list(sigma=0.2),
##D            features = 2, eta = 0.001, maxiter = 65)
##D pcv(kpc)
##D 
##D ## The interface puts data as first parameter
##D kpc <- ntbt_kha(iris[-test, -5], ~ ., kernel = "rbfdot", kpar = list(sigma=0.2),
##D                 features = 2, eta = 0.001, maxiter = 65)
##D pcv(kpc)
##D 
##D ## so it can be used easily in a pipeline.
##D iris[-test, -5] %>%
##D   ntbt_kha(~ ., kernel = "rbfdot", kpar = list(sigma=0.2),
##D            features = 2, eta = 0.001, maxiter = 65) %>%
##D   pcv()
##D 
##D 
##D ## ntbt_kkmeans: Kernel k-means
##D ## Original function to interface
##D sc <- kkmeans(~ ., data = iris[-test, -5], centers = 3)
##D centers(sc)
##D 
##D ## The interface puts data as first parameter
##D sc <- ntbt_kkmeans(iris[-test, -5], ~ ., centers = 3)
##D centers(sc)
##D 
##D ## so it can be used easily in a pipeline.
##D iris[-test, -5] %>%
##D   ntbt_kkmeans(~ ., centers = 3) %>%
##D   centers()
##D 
##D 
##D ## ntbt_kpca: Kernel Principal Components Analysis
##D data(iris)
##D test <- sample(1:150,20)
##D 
##D ## Original function to interface
##D kpc <- kpca(~ ., data = iris[-test, -5], kernel = "rbfdot",
##D             kpar = list(sigma = 0.2), features = 2)
##D pcv(kpc)
##D 
##D ## The interface puts data as first parameter
##D kpc <- ntbt_kpca(iris[-test, -5], ~ ., kernel = "rbfdot",
##D                  kpar = list(sigma = 0.2), features = 2)
##D pcv(kpc)
##D 
##D ## so it can be used easily in a pipeline.
##D iris[-test, -5] %>%
##D   ntbt_kpca(~ ., kernel = "rbfdot",
##D             kpar = list(sigma = 0.2), features = 2) %>%
##D   pcv()
##D 
##D 
##D ## ntbt_kqr: Kernel Quantile Regression
##D ## Not found example using formula interface, and I am
##D ## completely ignorant to construct one.
##D x <- sort(runif(300))
##D y <- sin(pi*x) + rnorm(300,0,sd=exp(sin(2*pi*x)))
##D 
##D dkqr <- data.frame(x, y)
##D 
##D ## Original function to interface
##D set.seed(1)
##D kqr(x, y, tau = 0.5, C = 0.15)
##D 
##D ## The interface puts data as first parameter
##D set.seed(1)
##D ntbt_kqr(dkqr, x, y, tau = 0.5, C = 0.15)
##D 
##D ## so it can be used easily in a pipeline.
##D set.seed(1)
##D dkqr %>%
##D   ntbt_kqr(x, y, tau = 0.5, C = 0.15)
##D 
##D 
##D ## ntbt_ksvm: Support Vector Machines
##D data(spam)
##D index <- sample(1:dim(spam)[1])
##D spamtrain <- spam[index[1:floor(dim(spam)[1]/2)], ]
##D spamtest <- spam[index[((ceiling(dim(spam)[1]/2)) + 1):dim(spam)[1]], ]
##D 
##D ## Original function to interface
##D set.seed(1)
##D ksvm(type ~ ., data = spamtrain, kernel = "rbfdot",
##D      kpar = list(sigma = 0.05), C = 5, cross = 3)
##D 
##D ## The interface puts data as first parameter
##D set.seed(1)
##D ntbt_ksvm(spamtrain, type ~ ., kernel = "rbfdot",
##D           kpar = list(sigma = 0.05), C = 5, cross = 3)
##D 
##D ## so it can be used easily in a pipeline.
##D set.seed(1)
##D spamtrain %>%
##D   ntbt_ksvm(type ~ ., kernel = "rbfdot",
##D             kpar = list(sigma = 0.05), C = 5, cross = 3)
##D 
##D 
##D ## ntbt_lssvm: Least Squares Support Vector Machine
##D data(iris)
##D 
##D ## Original function to interface
##D set.seed(1)
##D lssvm(Species ~ ., data = iris)
##D 
##D ## The interface puts data as first parameter
##D set.seed(1)
##D ntbt_lssvm(iris, Species ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D set.seed(1)
##D iris %>%
##D   ntbt_lssvm(Species ~ .)
##D 
##D 
##D ## ntbt_rvm: Relevance Vector Machine
##D ## Not found example using formula interface, and I am
##D ## completely ignorant to construct one.
##D x <- seq(-20,20,0.1)
##D y <- sin(x)/x + rnorm(401,sd=0.05)
##D 
##D drvm <- data.frame(x, y)
##D 
##D ## Original function to interface
##D set.seed(1)
##D rvm(x, y, tau = 0.5, C = 0.15)
##D 
##D ## The interface puts data as first parameter
##D set.seed(1)
##D ntbt_rvm(drvm, x, y, tau = 0.5, C = 0.15)
##D 
##D ## so it can be used easily in a pipeline.
##D set.seed(1)
##D drvm %>%
##D   ntbt_rvm(x, y, tau = 0.5, C = 0.15)
##D 
##D 
##D ## ntbt_sigest: Hyperparameter estimation for the Gaussian Radial Basis kernel
##D data(promotergene)
##D 
##D ## Original function to interface
##D set.seed(1)
##D sigest(Class ~ ., data = promotergene)
##D 
##D ## The interface puts data as first parameter
##D set.seed(1)
##D ntbt_sigest(promotergene, Class ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D set.seed(1)
##D promotergene %>%
##D   ntbt_sigest(Class ~ .)
##D 
##D ## ntbt_specc: Spectral Clustering
##D ## Not found example using formula interface, and I am
##D ## completely ignorant to construct one.
## End(Not run)



