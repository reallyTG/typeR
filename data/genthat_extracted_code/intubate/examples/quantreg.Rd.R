library(intubate)


### Name: quantreg
### Title: Interfaces for quantreg package for data science pipelines.
### Aliases: ntbt_dynrq ntbt_KhmaladzeTest ntbt_nlrq ntbt_rq ntbt_rqProcess
###   ntbt_rqss
### Keywords: intubate magrittr quantreg dynrq KhmaladzeTest nlrq rq
###   rqProcess rqss

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(quantreg)
##D 
##D 
##D ## ntbt_dynrq: Dynamic Linear Quantile Regression
##D require(zoo)
##D data("UKDriverDeaths", package = "datasets")
##D dta <- data.frame(uk = log10(UKDriverDeaths))
##D 
##D ## Original function to interface
##D dynrq(uk ~ L(uk, 1) + L(uk, 12), data = dta)
##D 
##D ## The interface puts data as first parameter
##D ntbt_dynrq(dta, uk ~ L(uk, 1) + L(uk, 12))
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_dynrq(uk ~ L(uk, 1) + L(uk, 12))
##D 
##D 
##D ## ntbt_KhmaladzeTest: Tests of Location and Location Scale Shift Hypotheses for Linear Models
##D data(barro)
##D ## Original function to interface
##D KhmaladzeTest(y.net ~ lgdp2 + fse2 + gedy2 + Iy2 + gcony2, 
##D               data = barro, taus = seq(.05,.95,by = .01))
##D 
##D ## The interface puts data as first parameter
##D ntbt_KhmaladzeTest(barro, y.net ~ lgdp2 + fse2 + gedy2 + Iy2 + gcony2, 
##D                    taus = seq(.05,.95,by = .01))
##D 
##D ## so it can be used easily in a pipeline.
##D barro %>%
##D   ntbt_KhmaladzeTest(y.net ~ lgdp2 + fse2 + gedy2 + Iy2 + gcony2, 
##D                      taus = seq(.05,.95,by = .01))
##D 
##D 
##D ## ntbt_nlrq: Function to compute nonlinear quantile regression estimates
##D Dat <- NULL; Dat$x <- rep(1:25, 20)
##D set.seed(1)
##D Dat$y <- SSlogis(Dat$x, 10, 12, 2)*rnorm(500, 1, 0.1)
##D 
##D ## Original function to interface
##D nlrq(y ~ SSlogis(x, Asym, mid, scal), data = Dat, tau = 0.5, trace = TRUE)
##D 
##D ## The interface puts data as first parameter
##D ntbt_nlrq(Dat, y ~ SSlogis(x, Asym, mid, scal), tau = 0.5, trace = TRUE)
##D 
##D ## so it can be used easily in a pipeline.
##D Dat %>%
##D   ntbt_nlrq(y ~ SSlogis(x, Asym, mid, scal), tau = 0.5, trace = TRUE)
##D 
##D 
##D ## ntbt_rq: Quantile Regression
##D data(stackloss)
##D dta <- data.frame(stack.loss, stack.x)
##D 
##D ## Original function to interface
##D rq(stack.loss ~ stack.x, .5, data = dta)  # median (l1) regression  fit for the stackloss data. 
##D 
##D ## The interface puts data as first parameter
##D ntbt_rq(dta, stack.loss ~ stack.x, .5)
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_rq(stack.loss ~ stack.x, .5)
##D 
##D 
##D ## ntbt_rqProcess: Compute Standardized Quantile Regression Process
##D ## Original function to interface
##D data(barro)
##D rqProcess(y.net ~ lgdp2 + fse2 + gedy2 + Iy2 + gcony2, 
##D           data = barro, taus = seq(.05,.95,by = .01))
##D 
##D ## The interface puts data as first parameter
##D ntbt_rqProcess(barro, y.net ~ lgdp2 + fse2 + gedy2 + Iy2 + gcony2, 
##D                taus = seq(.05,.95,by = .01))
##D 
##D ## so it can be used easily in a pipeline.
##D barro %>%
##D   ntbt_rqProcess(y.net ~ lgdp2 + fse2 + gedy2 + Iy2 + gcony2, 
##D                  taus = seq(.05,.95,by = .01))
##D 
##D 
##D ## ntbt_rqss: Additive Quantile Regression Smoothing
##D n <- 200
##D x <- sort(rchisq(n,4))
##D z <- x + rnorm(n)
##D y <- log(x)+ .1*(log(x))^2 + log(x)*rnorm(n)/4 + z
##D dta <- data.frame(x, y, z)
##D 
##D ## Original function to interface
##D rqss(y ~ qss(x, constraint= "N") + z, data = dta)
##D 
##D ## The interface puts data as first parameter
##D ntbt_rqss(dta, y ~ qss(x, constraint= "N") + z)
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_rqss(y ~ qss(x, constraint= "N") + z)
## End(Not run)



