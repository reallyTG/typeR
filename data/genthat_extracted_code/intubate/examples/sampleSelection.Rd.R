library(intubate)


### Name: sampleSelection
### Title: Interfaces for sampleSelection package for data science
###   pipelines.
### Aliases: ntbt_probit ntbt_binaryChoice ntbt_selection ntbt_heckit
### Keywords: intubate magrittr sampleSelection probit binaryChoice
###   selection heckit

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(sampleSelection)
##D 
##D 
##D ## ntbt_probit: Binary choice models
##D ## ntbt_binaryChoice:  (no examples found)
##D data(Mroz87)
##D Mroz87$kids <- Mroz87$kids5 > 0 | Mroz87$kids618 > 0
##D Mroz87$age30.39 <- Mroz87$age < 40
##D Mroz87$age50.60 <- Mroz87$age >= 50
##D 
##D ## Original function to interface
##D probit(lfp ~ kids + age30.39 + age50.60 + educ + hushrs +
##D          huseduc + huswage + mtr + motheduc, data=Mroz87)
##D 
##D ## The interface puts data as first parameter
##D ntbt_probit(Mroz87, lfp ~ kids + age30.39 + age50.60 + educ + hushrs +
##D               huseduc + huswage + mtr + motheduc)
##D 
##D ## so it can be used easily in a pipeline.
##D Mroz87 %>%
##D   ntbt_probit(lfp ~ kids + age30.39 + age50.60 + educ + hushrs +
##D                 huseduc + huswage + mtr + motheduc)
##D 
##D 
##D 
##D ## ntbt_selection: Heckman-style selection models
##D ## ntbt_heckit:
##D data( Mroz87 )
##D Mroz87$kids  <- ( Mroz87$kids5 + Mroz87$kids618 > 0 )
##D 
##D ## Original function to interface
##D # Two-step estimation
##D heckit(lfp ~ age + I( age^2 ) + faminc + kids + educ,
##D         wage ~ exper + I( exper^2 ) + educ + city, Mroz87)
##D # ML estimation
##D selection(lfp ~ age + I( age^2 ) + faminc + kids + educ,
##D           wage ~ exper + I( exper^2 ) + educ + city, Mroz87)
##D 
##D ## The interface puts data as first parameter
##D # Two-step estimation
##D ntbt_heckit(Mroz87, lfp ~ age + I( age^2 ) + faminc + kids + educ,
##D             wage ~ exper + I( exper^2 ) + educ + city)
##D # ML estimation
##D ntbt_selection(Mroz87, lfp ~ age + I( age^2 ) + faminc + kids + educ,
##D                wage ~ exper + I( exper^2 ) + educ + city)
##D 
##D ## so it can be used easily in a pipeline.
##D # Two-step estimation
##D Mroz87 %>%
##D   ntbt_heckit(lfp ~ age + I( age^2 ) + faminc + kids + educ,
##D               wage ~ exper + I( exper^2 ) + educ + city)
##D # ML estimation
##D Mroz87 %>%
##D   ntbt_selection(lfp ~ age + I( age^2 ) + faminc + kids + educ,
##D                  wage ~ exper + I( exper^2 ) + educ + city)
## End(Not run)



