library(sommer)


### Name: bivariateRun
### Title: bivariateRun functionality
### Aliases: bivariateRun

### ** Examples


# ####=========================================####
# ####=========================================####
# #### EXAMPLE 1
# #### simple example with univariate models
# ####=========================================####
# ####=========================================####
# data("DT_cpdata")
# #### create the variance-covariance matrix
# A <- A.mat(GT)
# #### look at the data and fit the model
# head(DT)
# ans.m <- mmer(cbind(Yield,color,FruitAver, Firmness)~1,
#                random=~ vs(id, Gu=A, Gtc=unsm(4))
#                + vs(Rowf,Gtc=diag(4))
#                + vs(Colf,Gtc=diag(4)), na.method.Y="include",
#                rcov=~ vs(units,Gtc=unsm(4)), return.param = TRUE,
#                data=DT)
# 
# # define the number of cores (number of bivariate models) as (nt*(nt-1))/2 
# nt=4
# (nt*(nt-1))/2
# res <- bivariateRun(ans.m,n.core = 6)
# # now use the variance componets to fit a join model
# mm <- transformConstraints(ans.m[[8]],3)
# 
# ans.m.final <- mmer(cbind(Yield,color,FruitAver, Firmness)~1,
#               random=~ vs(id, Gu=A, Gtc=unsm(4))
#               + vs(Rowf,Gtc=diag(4))
#               + vs(Colf,Gtc=diag(4)), na.method.Y="include",
#               rcov=~ vs(units,Gtc=unsm(4)), 
#               init = res$sigmas_scaled, constraints = mm,
#               data=DT, iters=1)
# 
# summary(ans.m.final)




