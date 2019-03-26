library(CopulaCenR)


### Name: predict.CopulaCenR
### Title: Predictions from CopulaCenR regression models
### Aliases: predict.CopulaCenR

### ** Examples

data(AREDS)
# fit a Copula2-Sieve model
copula2_sp <- ic_spTran_copula(data = AREDS, copula = "Copula2",
              l = 0, u = 15, m = 3, r = 3,
              var_list = c("ENROLLAGE","rs2284665","SevScaleBL"))
# Predicted probabilities for newdata
newdata = data.frame(id = rep(1:3, each=2), ind = rep(c(1,2),3),
                     time = c(2,3,5,6,7,8),
                    SevScaleBL = rep(3,6),
                    ENROLLAGE = rep(60,6),
                    rs2284665 = c(0,0,1,1,2,2))
output <- predict(object = copula2_sp, newdata = newdata)



