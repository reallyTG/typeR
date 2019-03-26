library(semTools)


### Name: twostage
### Title: Fit a lavaan model using 2-Stage Maximum Likelihood (TSML)
###   estimation for missing data.
### Aliases: twostage cfa.2stage sem.2stage growth.2stage lavaan.2stage

### ** Examples


## impose missing data for example
HSMiss <- HolzingerSwineford1939[ , c(paste("x", 1:9, sep = ""),
                                      "ageyr","agemo","school")]
set.seed(12345)
HSMiss$x5 <- ifelse(HSMiss$x5 <= quantile(HSMiss$x5, .3), NA, HSMiss$x5)
age <- HSMiss$ageyr + HSMiss$agemo/12
HSMiss$x9 <- ifelse(age <= quantile(age, .3), NA, HSMiss$x9)

## specify CFA model from lavaan's ?cfa help page
HS.model <- '
  visual  =~ x1 + x2 + x3
  textual =~ x4 + x5 + x6
  speed   =~ x7 + x8 + x9
'

## use ageyr and agemo as auxiliary variables
out <- cfa.2stage(model = HS.model, data = HSMiss, aux = c("ageyr","agemo"))

## two versions of a corrected chi-squared test results are shown
out
## see Savalei & Bentler (2009) and Savalei & Falk (2014) for details

## the summary additionally provides the parameter estimates with corrected
## standard errors, test statistics, and confidence intervals, along with
## any other options that can be passed to parameterEstimates()
summary(out, standardized = TRUE)



## use parameter labels to fit a more constrained model
modc <- '
  visual  =~ x1 + x2 + x3
  textual =~ x4 + x5 + x6
  speed   =~ x7 + a*x8 + a*x9
'
outc <- cfa.2stage(model = modc, data = HSMiss, aux = c("ageyr","agemo"))


## use the anova() method to test this constraint
anova(out, outc)
## like for a single model, two corrected statistics are provided




