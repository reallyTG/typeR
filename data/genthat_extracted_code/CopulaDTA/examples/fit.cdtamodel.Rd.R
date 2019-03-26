library(CopulaDTA)


### Name: fit.cdtamodel
### Title: Fit copula based bivariate beta-binomial distribution to
###   diagnostic data.
### Aliases: fit.cdtamodel

### ** Examples

data(telomerase)
model1 <-  cdtamodel(copula = 'fgm')

model2 <- cdtamodel(copula = 'fgm',
               modelargs=list(param=2,
                              prior.lse='normal',
                              par.lse1=0,
                              par.lse2=5,
                              prior.lsp='normal',
                              par.lsp1=0,
                              par.lsp2=5))

model3 <-  cdtamodel(copula = 'fgm',
               modelargs = list(formula.se = StudyID ~ Test - 1))
## Not run: 
##D fit1 <- fit(model1,
##D                 SID='ID',
##D                 data=telomerase,
##D                 iter=2000,
##D                 warmup=1000,
##D                 thin=1,
##D                 seed=3)
##D 
##D 
##D fit2 <- fit(model2,
##D                 SID='StudyID',
##D                 data=ascus,
##D                 iter=2000,
##D                 warmup=1000,
##D                 thin=1,
##D                 seed=3)
## End(Not run)




