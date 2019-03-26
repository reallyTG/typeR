library(intubate)


### Name: lfe
### Title: Interfaces for lfe package for data science pipelines.
### Aliases: ntbt_felm
### Keywords: intubate magrittr lfe felm

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(lfe)
##D 
##D oldopts <- options(lfe.threads=1)
##D 
##D set.seed(123)
##D ## create covariates
##D x <- rnorm(1000)
##D x2 <- rnorm(length(x))
##D ## individual and firm
##D id <- factor(sample(20,length(x),replace=TRUE))
##D firm <- factor(sample(13,length(x),replace=TRUE))
##D ## effects for them
##D id.eff <- rnorm(nlevels(id))
##D firm.eff <- rnorm(nlevels(firm))
##D ## left hand side
##D u <- rnorm(length(x))
##D y <- x + 0.5*x2 + id.eff[id] + firm.eff[firm] + u
##D data <- data.frame(x = x, x2 = x2, id = id,
##D                    firm = firm, u = u, y = y)
##D 
##D ## Original function to interface
##D est <- felm(y ~ x + x2 | id + firm, data)
##D summary(est)
##D 
##D ## The interface reverses the order of data and formula
##D est <- ntbt_felm(data, y ~ x + x2 | id + firm)
##D summary(est)
##D 
##D ## so it can be used easily in a pipeline.
##D data %>%
##D   ntbt_felm(y ~ x + x2 | id + firm) %>%
##D   summary()
## End(Not run)



