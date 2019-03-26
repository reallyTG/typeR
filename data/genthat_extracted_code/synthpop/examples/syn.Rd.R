library(synthpop)


### Name: syn
### Title: Generating synthetic data sets
### Aliases: syn syn.strata print.synds
### Keywords: datagen tree regression

### ** Examples

### selection of variables
vars <- c("sex","age","marital","income","ls","smoke")
ods  <- SD2011[1:1000, vars]
 
### default synthesis
s1 <- syn(ods)
s1
  
### synthesis with default parametric methods
s2 <- syn(ods, method = "parametric", seed = 1)
s2$method
  
### multiple synthesis of selected variables with customised methods
s3 <- syn(ods, visit.sequence = c(2, 1, 4, 5), m = 2,
          method = c("logreg","sample","","normrank","ctree",""),
          ctree.minbucket = 10)
summary(s3)
summary(s3, msel = 1:2)
  
### adjustment to the default predictor matrix 
s4.ini <- syn(data = ods, visit.sequence = c(1, 2, 5, 3),
              m = 0, drop.not.used = FALSE)
pM.cor <- s4.ini$predictor.matrix
pM.cor["marital","ls"] <- 0
s4 <- syn(data = ods, visit.sequence = c(1, 2, 5, 3),
          predictor.matrix = pM.cor)
  
### handling missing values in continuous variables
s5 <- syn(ods, cont.na = list(income = c(NA, -8)))
  
### rules for restricted values - marital status of males under 18 should be 'single'
s6 <- syn(ods, rules = list(marital = "age < 18 & sex == 'MALE'"),
          rvalues = list(marital = 'SINGLE'), method = "parametric", seed = 1)
with(s6$syn, table(marital[age < 18 & sex == 'MALE']))
### results for default parametric synthesis without the rule  
with(s2$syn, table(marital[age < 18 & sex == 'MALE']))

### synthesis with ipf for all variables
s7 <- syn(ods[, 1:3], method = "ipf", numtocat = "age")

### stratified synthesis
s8 <- syn.strata(ods, strata = "sex")



