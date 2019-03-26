library(gcerisk)


### Name: gcecox
### Title: Fit Generalized Competing Event Model Based on Proportional
###   Hazards Regression
### Aliases: gcecox

### ** Examples

# sample data to test
data(Sample)
test <- Sample
rm(list=setdiff(ls(), "test"))
test <- transform(test, LRF_OR_DF_FLAG = as.numeric(test$LRFFLAG | test$DFFLAG))
test <- transform(test, CMFLAG = as.numeric(test$OSFLAG & !test$LRFFLAG & !test$DFFLAG))
test <- transform(test, ACMFLAG = as.numeric(test$LRF_OR_DF_FLAG | test$CMFLAG))

Time <- test$OSMO/12
Ind <- data.frame(test$LRF_OR_DF_FLAG, test$CMFLAG, test$ACMFLAG)
Cov <- test[,c(3,4,6,15)]
N <- 100
M <- 5
t <- 5

fit <- gcecox(Time, Ind, Cov, N, M, t)




