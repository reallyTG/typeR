library(intubate)


### Name: gss
### Title: Interfaces for gss package for data science pipelines.
### Aliases: ntbt_gssanova ntbt_gssanova0 ntbt_gssanova1 ntbt_ssanova
###   ntbt_ssanova0 ntbt_ssanova9 ntbt_sscden ntbt_sscden1 ntbt_sscox
###   ntbt_ssden ntbt_ssden1 ntbt_sshzd ntbt_ssllrm
### Keywords: intubate magrittr gss gssanova gssanova0 gssanova1 ssanova
###   ssanova0 ssanova9 sscden sscden1 sscox ssden ssden1 sshzd ssllrm

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(gss)
##D 
##D 
##D ## ntbt_gssanova: Fitting Smoothing Spline ANOVA Models with Non-Gaussian Responses
##D data(bacteriuria)
##D 
##D ## Original function to interface
##D gssanova(infect ~ trt + time, family="binomial", data = bacteriuria,
##D          id.basis = (1:820)[bacteriuria$id %in% c(3,38)], random = ~ 1 | id)
##D gssanova0(infect ~ trt + time, family="binomial", data = bacteriuria)
##D gssanova1(infect ~ trt + time, family="binomial", data = bacteriuria,
##D          id.basis = (1:820)[bacteriuria$id %in% c(3,38)], random = ~ 1 | id)
##D 
##D ## The interface puts data as first parameter
##D ntbt_gssanova(bacteriuria, infect ~ trt + time, family="binomial",
##D               id.basis = (1:820)[bacteriuria$id %in% c(3,38)], random = ~ 1 | id)
##D ntbt_gssanova0(bacteriuria, infect ~ trt + time, family="binomial")
##D ntbt_gssanova1(bacteriuria, infect ~ trt + time, family="binomial",
##D                id.basis = (1:820)[bacteriuria$id %in% c(3,38)], random = ~ 1 | id)
##D 
##D ## so it can be used easily in a pipeline.
##D bacteriuria %>%
##D   ntbt_gssanova(infect ~ trt + time, family="binomial",
##D                 id.basis = (1:820)[bacteriuria$id %in% c(3,38)], random = ~ 1 | id)
##D bacteriuria %>%
##D   ntbt_gssanova0(infect ~ trt + time, family="binomial")
##D bacteriuria %>%
##D   ntbt_gssanova1(infect ~ trt + time, family="binomial",
##D                  id.basis = (1:820)[bacteriuria$id %in% c(3,38)], random = ~ 1 | id)
##D 
##D 
##D ## ntbt_ssanova: Fitting Smoothing Spline ANOVA Models
##D data(nox)
##D 
##D ## Original function to interface
##D ssanova(log10(nox) ~ comp*equi, data = nox)
##D ssanova0(log10(nox) ~ comp*equi, data = nox)
##D 
##D ## The interface puts data as first parameter
##D ntbt_ssanova(nox, log10(nox) ~ comp*equi)
##D ntbt_ssanova0(nox, log10(nox) ~ comp*equi)
##D 
##D ## so it can be used easily in a pipeline.
##D nox %>%
##D   ntbt_ssanova(log10(nox) ~ comp*equi)
##D nox %>%
##D   ntbt_ssanova0(log10(nox) ~ comp*equi)
##D 
##D 
##D ## ntbt_ssanova9: Fitting Smoothing Spline ANOVA Models with Correlated Data
##D x <- runif(100); y <- 5 + 3*sin(2*pi*x) + rnorm(x)
##D dta <- data.frame(x, y)
##D 
##D ## Original function to interface
##D ssanova9(y ~ x, data = dta, cov = list("arma", c(1, 0)))
##D 
##D ## The interface puts data as first parameter
##D ntbt_ssanova9(dta, y ~ x, cov = list("arma", c(1, 0)))
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_ssanova9(y ~ x, cov = list("arma", c(1, 0)))
##D 
##D 
##D ## ntbt_sscden: Estimating Conditional Probability Density Using Smoothing Splines
##D data(penny)
##D 
##D ## Original function to interface
##D set.seed(5732)
##D sscden(~ year*mil, ~ mil, data = penny, ydomain = data.frame(mil=c(49, 61)))
##D sscden1(~ year*mil, ~ mil, data = penny, ydomain = data.frame(mil=c(49, 61)))
##D 
##D ## The interface puts data as first parameter
##D set.seed(5732)
##D ntbt_sscden(penny, ~ year*mil, ~ mil, ydomain = data.frame(mil=c(49, 61)))
##D ntbt_sscden1(penny, ~ year*mil, ~ mil, ydomain = data.frame(mil=c(49, 61)))
##D 
##D ## so it can be used easily in a pipeline.
##D set.seed(5732)
##D penny %>%
##D   ntbt_sscden(~ year*mil, ~ mil, ydomain = data.frame(mil=c(49, 61)))
##D penny %>%
##D   ntbt_sscden1(~ year*mil, ~ mil, ydomain = data.frame(mil=c(49, 61)))
##D 
##D 
##D ## ntbt_sscox: Estimating Relative Risk Using Smoothing Splines
##D data(stan)
##D 
##D ## Original function to interface
##D sscox(Surv(futime, status) ~ age, data = stan)
##D 
##D ## The interface puts data as first parameter
##D ntbt_sscox(stan, Surv(futime, status) ~ age)
##D 
##D ## so it can be used easily in a pipeline.
##D stan %>%
##D   ntbt_sscox(Surv(futime, status) ~ age)
##D 
##D 
##D ## ntbt_ssden: Estimating Probability Density Using Smoothing Splines
##D data(aids)
##D ## rectangular quadrature
##D quad.pt <- expand.grid(incu=((1:40)-.5)/40*100,infe=((1:40)-.5)/40*100)
##D quad.pt <- quad.pt[quad.pt$incu<=quad.pt$infe,]
##D quad.wt <- rep(1,nrow(quad.pt))
##D quad.wt[quad.pt$incu==quad.pt$infe] <- .5
##D quad.wt <- quad.wt/sum(quad.wt)*5e3
##D 
##D ## Original function to interface
##D ssden(~ incu + infe, data = aids, subset = age >= 60,
##D       domain = data.frame(incu = c(0, 100), infe=c(0, 100)),
##D       quad = list(pt = quad.pt, wt = quad.wt))
##D ssden1(~ incu + infe, data = aids, subset = age >= 60,
##D        domain = data.frame(incu = c(0, 100), infe=c(0, 100)),
##D        quad = list(pt = quad.pt, wt = quad.wt))
##D 
##D ## The interface puts data as first parameter
##D ntbt_ssden(aids, ~ incu + infe, subset = age >= 60,
##D            domain = data.frame(incu = c(0, 100), infe=c(0, 100)),
##D            quad = list(pt = quad.pt, wt = quad.wt))
##D ntbt_ssden1(aids, ~ incu + infe, subset = age >= 60,
##D             domain = data.frame(incu = c(0, 100), infe=c(0, 100)),
##D             quad = list(pt = quad.pt, wt = quad.wt))
##D 
##D ## so it can be used easily in a pipeline.
##D aids %>%
##D   ntbt_ssden(~ incu + infe, subset = age >= 60,
##D              domain = data.frame(incu = c(0, 100), infe=c(0, 100)),
##D              quad = list(pt = quad.pt, wt = quad.wt))
##D aids %>%
##D   ntbt_ssden1(~ incu + infe, subset = age >= 60,
##D               domain = data.frame(incu = c(0, 100), infe=c(0, 100)),
##D               quad = list(pt = quad.pt, wt = quad.wt))
##D 
##D 
##D ## ntbt_sshzd: Estimating Hazard Function Using Smoothing Splines
##D data(gastric)
##D 
##D ## Original function to interface
##D sshzd(Surv(futime, status) ~ futime*trt, data = gastric)
##D 
##D ## The interface puts data as first parameter
##D ntbt_sshzd(gastric, Surv(futime, status) ~ futime*trt)
##D 
##D ## so it can be used easily in a pipeline.
##D gastric %>%
##D   ntbt_sshzd(Surv(futime, status) ~ futime*trt)
##D 
##D 
##D ## ntbt_ssllrm: Fitting Smoothing Spline Log-Linear Regression Models
##D test <- function(x)
##D         {.3*(1e6*(x^11*(1-x)^6)+1e4*(x^3*(1-x)^10))-2}
##D x <- (0:100)/100
##D p <- 1-1/(1+exp(test(x)))
##D y <- rbinom(x,3,p)
##D y1 <- as.ordered(y)
##D y2 <- as.factor(rbinom(x,1,p))
##D 
##D dta <- data.frame(x, y1, y2)
##D 
##D ## Original function to interface
##D ssllrm(~ y1*y2*x, ~ y1 + y2, data = dta)
##D 
##D ## The interface puts data as first parameter
##D ntbt_ssllrm(dta, ~ y1*y2*x, ~ y1 + y2)
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_ssllrm(~ y1*y2*x, ~ y1 + y2)
## End(Not run)



