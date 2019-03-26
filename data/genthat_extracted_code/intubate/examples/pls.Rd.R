library(intubate)


### Name: pls
### Title: Interfaces for pls package for data science pipelines.
### Aliases: ntbt_cppls ntbt_mvr ntbt_pcr ntbt_plsr
### Keywords: intubate magrittr pls cppls mvr pcr plsr

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(pls)
##D 
##D ## cppls
##D ## Original function to interface
##D yarn.cppls <- cppls(density ~ NIR, ncomp = 6, data = yarn, validation = "CV")
##D summary(yarn.cppls)
##D 
##D ## The interface reverses the order of data and formula
##D yarn.cppls <- ntbt_cppls(yarn, density ~ NIR, ncomp = 6, validation = "CV")
##D summary(yarn.cppls)
##D 
##D ## so it can be used easily in a pipeline.
##D yarn %>%
##D   ntbt_cppls(density ~ NIR, ncomp = 6, validation = "CV") %>%
##D   summary()
##D 
##D ## mvr
##D ## Original function to interface
##D yarn.mvr <- mvr(density ~ NIR, ncomp = 6, data = yarn, validation = "CV",
##D                 method = "oscorespls")
##D summary(yarn.mvr)
##D 
##D ## The interface reverses the order of data and formula
##D yarn.mvr <- ntbt_mvr(yarn, density ~ NIR, ncomp = 6, validation = "CV",
##D                      method = "oscorespls")
##D summary(yarn.mvr)
##D 
##D ## so it can be used easily in a pipeline.
##D yarn %>%
##D   ntbt_mvr(density ~ NIR, ncomp = 6, validation = "CV",
##D            method = "oscorespls") %>%
##D   summary()
##D 
##D ## pcr
##D ## Original function to interface
##D yarn.pcr <- pcr(density ~ NIR, ncomp = 6, data = yarn, validation = "CV")
##D summary(yarn.pcr)
##D 
##D ## The interface reverses the order of data and formula
##D yarn.pcr <- ntbt_pcr(yarn, density ~ NIR, ncomp = 6, validation = "CV")
##D summary(yarn.pcr)
##D 
##D ## so it can be used easily in a pipeline.
##D yarn %>%
##D   ntbt_pcr(density ~ NIR, ncomp = 6, validation = "CV") %>%
##D   summary()
##D 
##D ## plsr
##D ## Original function to interface
##D yarn.plsr <- plsr(density ~ NIR, ncomp = 6, data = yarn, validation = "CV")
##D summary(yarn.plsr)
##D 
##D ## The interface reverses the order of data and formula
##D yarn.plsr <- ntbt_plsr(yarn, density ~ NIR, ncomp = 6, validation = "CV")
##D summary(yarn.plsr)
##D 
##D ## so it can be used easily in a pipeline.
##D yarn %>%
##D   ntbt_plsr(density ~ NIR, ncomp = 6, validation = "CV") %>%
##D   summary()
## End(Not run)



