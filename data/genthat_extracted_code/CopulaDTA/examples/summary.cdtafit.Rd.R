library(CopulaDTA)


### Name: summary.cdtafit
### Title: Function to generate a summary a cdtafit object.
### Aliases: summary.cdtafit

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
##D 
##D fit1 <- fit(model1,
##D                 SID='ID',
##D                 data=telomerase,
##D                 iter=2000,
##D                 warmup=1000,
##D                 thin=1,
##D                 seed=3)
##D 
##D ss <- summary(fit1)
##D 
## End(Not run)



