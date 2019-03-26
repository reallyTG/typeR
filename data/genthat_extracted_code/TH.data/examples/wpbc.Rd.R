library(TH.data)


### Name: wpbc
### Title: Wisconsin Prognostic Breast Cancer Data
### Aliases: wpbc
### Keywords: datasets

### ** Examples


    data("wpbc", package = "TH.data")

    ### fit logistic regression model 
    coef(glm(status ~ ., data = wpbc[,colnames(wpbc) != "time"],
             family = binomial()))




