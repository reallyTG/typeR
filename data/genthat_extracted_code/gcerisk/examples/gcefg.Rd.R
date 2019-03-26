library(gcerisk)


### Name: gcefg
### Title: Fit Generalized Competing Event Model Based on Fine Gray
###   Regression
### Aliases: gcefg

### ** Examples

# sample data to test
data(Sample)
test <- Sample
d <- trunc(dim(test)[1]*0.1)
set.seed(seed=2017)
s <- sample(dim(test)[1],d,replace = FALSE)
test <- test[s,]
rm(list=setdiff(ls(), "test"))
test <- transform(test, LRF_OR_DF_FLAG = as.numeric(test$LRFFLAG | test$DFFLAG))
test <- transform(test, LRF_OR_DF_MO = pmin(test$LRFMO, test$DFMO))
test <- transform(test, CMFLAG = as.numeric(test$OSFLAG & !test$LRFFLAG & !test$DFFLAG))
test <- transform(test, ACMFLAG = as.numeric(test$LRF_OR_DF_FLAG | test$CMFLAG))
test <- transform(test, ACM_MO = pmin(test$LRF_OR_DF_MO, test$OSMO))

cod1 <- test$ACMFLAG
cod1[test$LRF_OR_DF_FLAG == 1] <- 1
cod1[test$CMFLAG == 1] <- 2
cod2 <- test$ACMFLAG
Ind <- data.frame(cod1 = cod1, cod2 = cod2)
Time <- test$OSMO/12
Cov <- test[,c(3,4,6,15)]

N <- 50
M <- 5
t <- 5

fit <- gcefg(Time, Ind, Cov, N, M, t)




