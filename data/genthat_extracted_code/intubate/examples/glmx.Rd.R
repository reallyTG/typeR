library(intubate)


### Name: glmx
### Title: Interfaces for glmx package for data science pipelines.
### Aliases: ntbt_glmx ntbt_hetglm
### Keywords: intubate magrittr glmx hetglm

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(glmx)
##D 
##D ## ntbt_glmx: Generalized Linear Models with Extra Parameters
##D set.seed(1)
##D d <- data.frame(x = runif(200, -1, 1))
##D d$y <- rnbinom(200, mu = exp(0 + 3 * d$x), size = 1)
##D require("MASS")
##D 
##D ## Original function to interface
##D glmx(y ~ x, data = d, family = negative.binomial, xlink = "log", xstart = 0)
##D 
##D ## The interface puts data as first parameter
##D ntbt_glmx(d, y ~ x, family = negative.binomial, xlink = "log", xstart = 0)
##D 
##D ## so it can be used easily in a pipeline.
##D d %>%
##D   ntbt_glmx(y ~ x, family = negative.binomial, xlink = "log", xstart = 0)
##D 
##D 
##D ## ntbt_hetglm: Heteroskedastic Binary Response GLMs
##D n <- 200
##D x <- rnorm(n)
##D ystar <- 1 + x +  rnorm(n, sd = exp(x))
##D y  <- factor(ystar > 0) 
##D dta <- data.frame(x, y)
##D 
##D ## Original function to interface
##D hetglm(y ~ x | 1, data = dta)
##D 
##D ## The interface puts data as first parameter
##D ntbt_hetglm(dta, y ~ x | 1)
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_hetglm(y ~ x | 1)
## End(Not run)



