library(bootstrapFP)


### Name: bootstrapFP
### Title: Bootstrap algorithms for Finite Population sampling
### Aliases: bootstrapFP bootstrapFP-package

### ** Examples


library(bootstrapFP)

### Generate population data ---
N   <- 20; n <- 5
x   <- rgamma(N, scale=10, shape=5)
y   <- abs( 2*x + 3.7*sqrt(x) * rnorm(N) )
pik <- n * x/sum(x)

### Draw a dummy sample ---
s  <- sample(N, n)

### Estimate bootstrap variance ---
bootstrapFP(y = y[s], pik = n/N, B=100, method = "ppSitter")
bootstrapFP(y = y[s], pik = pik[s], B=10, method = "ppHolmberg", design = 'brewer')
bootstrapFP(y = y[s], pik = pik[s], B=10, D=10, method = "ppChauvet")
bootstrapFP(y = y[s], pik = n/N, B=10, method = "dRaoWu")
bootstrapFP(y = y[s], pik = n/N, B=10, method = "dSitter")
bootstrapFP(y = y[s], pik = pik[s], B=10, method = "dAntalTille_UPS", design='brewer')
bootstrapFP(y = y[s], pik = n/N, B=10, method = "wRaoWuYue") 
bootstrapFP(y = y[s], pik = n/N, B=10, method = "wChipperfieldPreston")
bootstrapFP(y = y[s], pik = pik[s], B=10, method = "wGeneralised", distribution = 'normal')






