library(dfcrm)


### Name: getn
### Title: Sample size calculator for CRM trials
### Aliases: getn nopt print.crmsize
### Keywords: datasets

### ** Examples

apcs <- 0.6    
target <- 0.25
nlevel <- 5
psi <- 1.8     

# Sample size calculation with continuity correction
obj = getn(apcs, target, nlevel, psi, correction=TRUE)
obj

N = obj$n



