library(intubate)


### Name: psychomix
### Title: Interfaces for psychomix package for data science pipelines.
### Aliases: ntbt_btmix ntbt_raschmix
### Keywords: intubate magrittr psychomix btmix raschmix

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(psychomix)
##D 
##D 
##D ## ntbt_btmix: Finite Mixtures of Bradley-Terry Models
##D data("GermanParties2009", package = "psychotools")
##D 
##D ## omit single observation with education = 1
##D gp <- subset(GermanParties2009, education != "1")
##D gp$education <- factor(gp$education)
##D 
##D ## Original function to interface
##D set.seed(1)
##D cm <- btmix(preference ~ gender + education + age + crisis,
##D             data = gp, k = 1:4, nrep = 3)
##D plot(cm)
##D 
##D ## The interface puts data as first parameter
##D set.seed(1)
##D cm <- ntbt_btmix(gp, preference ~ gender + education + age + crisis,
##D                  k = 1:4, nrep = 3)
##D plot(cm)
##D 
##D ## so it can be used easily in a pipeline.
##D set.seed(1)
##D gp %>%
##D   ntbt_btmix(preference ~ gender + education + age + crisis, k = 1:4, nrep = 3) %>%
##D   plot()
##D 
##D 
##D 
##D ## ntbt_raschmix: Finite Mixtures of Rasch Models
##D set.seed(1)
##D r2 <- simRaschmix(design = "rost2")
##D d <- data.frame(
##D   x1 = rbinom(nrow(r2), prob = c(0.4, 0.6)[attr(r2, "cluster")], size = 1),
##D   x2 = rnorm(nrow(r2))
##D )
##D d$resp <- r2
##D 
##D ## Original function to interface
##D m1 <- raschmix(resp ~ 1, data = d, k = 1:3, score = "saturated")
##D plot(m1)
##D 
##D ## The interface puts data as first parameter
##D m1 <- ntbt_raschmix(d, resp ~ 1, k = 1:3, score = "saturated")
##D plot(m1)
##D 
##D ## so it can be used easily in a pipeline.
##D d %>%
##D   ntbt_raschmix(resp ~ 1, k = 1:3, score = "saturated") %>%
##D   plot()
## End(Not run)



