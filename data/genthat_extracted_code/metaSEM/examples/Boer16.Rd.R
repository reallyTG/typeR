library(metaSEM)


### Name: Boer16
### Title: Correlation Matrices from Boer et al. (2016)
### Aliases: Boer16
### Keywords: datasets

### ** Examples

## Not run: 
##D ## Stage 1 analysis
##D rand1 <- tssem1(Boer16$data, Boer16$n, method="REM", RE.type="Diag", acov="individual")
##D summary(rand1)
##D 
##D ## Stage 2 analysis
##D model2a <- 'JS+OC+LE ~ LMX+TFL
##D             LMX ~ TFL
##D             ## Variance of TFL is fixed at 1
##D             TFL ~~ 1*TFL
##D             ## Correlated residuals
##D             JS ~~ OC
##D             JS ~~ LE
##D             OC ~~ LE'
##D 
##D ## Display the model
##D plot(model2a)    
##D     
##D RAM2a <- lavaan2RAM(model2a, obs.variables = c("LMX", "TFL", "JS", "OC", "LE"),
##D                     A.notation="on", S.notation="with")
##D 
##D rand2a <- tssem2(rand1, Amatrix=RAM2a$A, Smatrix=RAM2a$S)
##D summary(rand2a)
##D 
##D ## Display the model with the parameter estimates
##D plot(rand2a, layout="spring")    
## End(Not run)



