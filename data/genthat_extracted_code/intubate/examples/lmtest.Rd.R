library(intubate)


### Name: lmtest
### Title: Interfaces for lmtest package for data science pipelines.
### Aliases: ntbt_bgtest ntbt_bptest ntbt_coxtest ntbt_dwtest
###   ntbt_encomptest ntbt_gqtest ntbt_grangertest ntbt_harvtest
###   ntbt_hmctest ntbt_jtest ntbt_raintest ntbt_resettest
### Keywords: intubate magrittr lmtest bgtest bptest coxtest dwtest
###   encomptest gqtest grangertest harvtest hmctest jtest raintest
###   resettest

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(lmtest)
##D 
##D ## ntbt_bgtest: Breusch-Godfrey Test for higher-order serial correlation
##D x <- rep(c(1, -1), 50)
##D y1 <- 1 + x + rnorm(100)
##D dta <- data.frame(x, y1)
##D 
##D ## or for fourth-order serial correlation
##D ## Original function to interface
##D bgtest(y1 ~ x, order = 4, data = dta)
##D 
##D ## The interface puts data as first parameter
##D ntbt_bgtest(dta, y1 ~ x, order = 4)
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_bgtest(y1 ~ x, order = 4)
##D 
##D 
##D ## ntbt_bptest: Breusch-Pagan test against heteroskedasticity
##D ## ntbt_gqtest: Goldfeld-Quandt test against heteroskedasticity
##D ## ntbt_hmctest: Harrison-McCabe test for heteroskedasticity
##D x <- rep(c(-1,1), 50)
##D err1 <- c(rnorm(50, sd=1), rnorm(50, sd=2))
##D err2 <- rnorm(100)
##D y1 <- 1 + x + err1
##D y2 <- 1 + x + err2
##D dtah <- data.frame(x, y1, y2)
##D 
##D ## Original function to interface
##D bptest(y1 ~ x, data = dtah)
##D gqtest(y1 ~ x, data = dtah)
##D hmctest(y1 ~ x, data = dtah)
##D bptest(y2 ~ x, data = dtah)
##D gqtest(y2 ~ x, data = dtah)
##D hmctest(y2 ~ x, data = dtah)
##D 
##D ## The interface puts data as first parameter
##D ntbt_bptest(dtah, y1 ~ x)
##D ntbt_gqtest(dtah, y1 ~ x)
##D ntbt_hmctest(dtah, y1 ~ x)
##D ntbt_bptest(dtah, y2 ~ x)
##D ntbt_gqtest(dtah, y2 ~ x)
##D ntbt_hmctest(dtah, y2 ~ x)
##D 
##D ## so it can be used easily in a pipeline.
##D dtah %>%
##D   ntbt_bptest(y1 ~ x)
##D dtah %>%
##D   ntbt_gqtest(y1 ~ x)
##D dtah %>%
##D   ntbt_hmctest(y1 ~ x)
##D dtah %>%
##D   ntbt_bptest(y2 ~ x)
##D dtah %>%
##D   ntbt_gqtest(y2 ~ x)
##D dtah %>%
##D   ntbt_hmctest(y2 ~ x)
##D 
##D 
##D ## ntbt_coxtest: Cox Test for Comparing Non-Nested Models
##D ## ntbt_encomptest: encompassing test of Davidson & MacKinnon for comparing non-nested models
##D ## ntbt_jtest: Davidson-MacKinnon J test for comparing non-nested models
##D data(USDistLag)
##D usdl <- na.contiguous(cbind(USDistLag, lag(USDistLag, k = -1)))
##D colnames(usdl) <- c("con", "gnp", "con1", "gnp1")
##D 
##D ## Original function to interface
##D coxtest(con ~ gnp + con1, con ~ gnp + gnp1, data = usdl)
##D encomptest(con ~ gnp + con1, con ~ gnp + gnp1, data = usdl)
##D jtest(con ~ gnp + con1, con ~ gnp + gnp1, data = usdl)
##D 
##D ## The interface puts data as first parameter
##D ntbt_coxtest(usdl, con ~ gnp + con1, con ~ gnp + gnp1)
##D ntbt_encomptest(usdl, con ~ gnp + con1, con ~ gnp + gnp1)
##D ntbt_jtest(usdl, con ~ gnp + con1, con ~ gnp + gnp1)
##D 
##D ## so it can be used easily in a pipeline.
##D usdl %>%
##D   ntbt_coxtest(con ~ gnp + con1, con ~ gnp + gnp1)
##D usdl %>%
##D   ntbt_encomptest(con ~ gnp + con1, con ~ gnp + gnp1)
##D usdl %>%
##D   ntbt_jtest(con ~ gnp + con1, con ~ gnp + gnp1)
##D 
##D ## ntbt_dwtest: Durbin-Watson test for autocorrelation of disturbances
##D err1 <- rnorm(100)
##D x <- rep(c(-1,1), 50)
##D y1 <- 1 + x + err1
##D err2 <- filter(err1, 0.9, method="recursive")
##D y2 <- 1 + x + err2
##D dta <- data.frame(y1, y2, x)
##D 
##D ## Original function to interface
##D dwtest(y1 ~ x, data = dta)
##D dwtest(y2 ~ x, data = dta)
##D 
##D ## The interface puts data as first parameter
##D ntbt_dwtest(dta, y1 ~ x)
##D ntbt_dwtest(dta, y2 ~ x)
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_dwtest(y1 ~ x)
##D dta %>%
##D   ntbt_dwtest(y2 ~ x)
##D 
##D 
##D ## ntbt_grangertest: Test for Granger Causality
##D data(ChickEgg)
##D ## Original function to interface
##D grangertest(egg ~ chicken, order = 3, data = ChickEgg)
##D grangertest(chicken ~ egg, order = 3, data = ChickEgg)
##D 
##D ## The interface puts data as first parameter
##D ntbt_grangertest(ChickEgg, egg ~ chicken, order = 3)
##D ntbt_grangertest(ChickEgg, chicken ~ egg, order = 3)
##D 
##D ## so it can be used easily in a pipeline.
##D ChickEgg %>%
##D   ntbt_grangertest(egg ~ chicken, order = 3)
##D ChickEgg %>%
##D   ntbt_grangertest(chicken ~ egg, order = 3)
##D 
##D 
##D ## ntbt_harvtest: Harvey-Collier test for linearity
##D x <- 1:50
##D y1 <- 1 + x + rnorm(50)
##D y2 <- y1 + 0.3*x^2
##D dta <- data.frame(y1, x)
##D 
##D ## Original function to interface
##D harvtest(y1 ~ x, data = dta)
##D 
##D ## The interface puts data as first parameter
##D ntbt_harvtest(dta, y1 ~ x)
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_harvtest(y1 ~ x)
##D 
##D ## ntbt_raintest: Rainbow test for linearity
##D x <- c(1:30)
##D y <- x^2 + rnorm(30,0,2)
##D dta <- data.frame(x, y)
##D 
##D ## Original function to interface
##D raintest(y ~ x, data = dta)
##D 
##D ## The interface puts data as first parameter
##D ntbt_raintest(dta, y ~ x)
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_raintest(y ~ x)
##D 
##D 
##D ## ntbt_resettest: Ramsey's RESET test for functional form
##D x <- c(1:30)
##D y1 <- 1 + x + x^2 + rnorm(30)
##D y2 <- 1 + x + rnorm(30)
##D dta <- data.frame(x, y1, y2)
##D 
##D ## Original function to interface
##D resettest(y1 ~ x , power=2, type="regressor", data = dta)
##D resettest(y2 ~ x , power=2, type="regressor", data = dta)
##D 
##D ## The interface puts data as first parameter
##D ntbt_resettest(dta, y1 ~ x , power=2, type="regressor")
##D ntbt_resettest(dta, y2 ~ x , power=2, type="regressor")
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_resettest(y1 ~ x , power=2, type="regressor")
##D dta %>%
##D   ntbt_resettest(y2 ~ x , power=2, type="regressor")
## End(Not run)



