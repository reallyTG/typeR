library(LogisticDx)


### Name: nhanes3
### Title: NHANES III data
### Aliases: nhanes3
### Keywords: datasets

### ** Examples

## use simpler column names
data("nhanes3", package="LogisticDx")
n1 <- c("ID", "pStrat", "pPSU", "sWt", "age", "sex",
        "race", "bWt", "h", "sysBP", "diasBP", "sm100",
        "smCurr", "smok", "chol", "htn")
names(nhanes3) <- n1



