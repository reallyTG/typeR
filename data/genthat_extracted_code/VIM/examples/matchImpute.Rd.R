library(VIM)


### Name: matchImpute
### Title: Fast matching/imputation based on categorical variable
### Aliases: matchImpute
### Keywords: manip

### ** Examples


data(sleep,package="VIM")
imp_data <- matchImpute(sleep,variable=c("NonD","Dream","Sleep","Span","Gest"),
  match_var=c("Exp","Danger"))

data(testdata,package="VIM")
imp_testdata1 <- matchImpute(testdata$wna,match_var=c("c1","c2","b1","b2"))

dt <- data.table(testdata$wna)
imp_testdata2 <- matchImpute(dt,match_var=c("c1","c2","b1","b2"))





