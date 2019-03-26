library(dominanceanalysis)


### Name: dominanceAnalysis
### Title: Dominance analysis for OLS (univariate and multivariate), GLM
###   and LMM models
### Aliases: dominanceAnalysis

### ** Examples

data(longley)
lm.1<-lm(Employed~.,longley)
da<-dominanceAnalysis(lm.1)
print(da)
summary(da)
# Maintaining year as a constant on all submodels
da.no.year<-dominanceAnalysis(lm.1,constants='Year')
print(da.no.year)
summary(da.no.year)
# Parameter terms could be used to group variables
da.terms=c('GNP.deflator+GNP',
           'Unemployed+Armed.Forces+Population+Unemployed',
           'Year')
da.grouped<-dominanceAnalysis(lm.1,terms=da.terms)
print(da.grouped)
summary(da.grouped)



