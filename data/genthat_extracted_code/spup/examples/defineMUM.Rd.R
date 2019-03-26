library(spup)


### Name: defineMUM
### Title: Define Mulivariate Uncertainty Model
### Aliases: defineMUM

### ** Examples


set.seed(12345)

data(OC, OC_sd, TN, TN_sd)
OC_crm <- makeCRM(acf0 = 0.6, range = 5000, model = "Sph")
OC_UM <- defineUM(TRUE, distribution = "norm", distr_param = c(OC, OC_sd), crm = OC_crm, id = "OC")
class(OC_UM)
TN_crm <- makeCRM(acf0 = 0.4, range = 5000, model = "Sph")
TN_UM <- defineUM(TRUE, distribution = "norm", distr_param = c(TN, TN_sd), crm = TN_crm, id = "TN")
class(TN_UM)

soil_prop <- list(OC_UM,TN_UM)
mySpatialMUM <- defineMUM(soil_prop, matrix(c(1,0.7,0.7,1), nrow=2, ncol=2))
class(mySpatialMUM)

# scalar
scalarUM <- defineUM(uncertain = TRUE, distribution = "norm", 
                     distr_param = c(1, 2), id="Var1")                
scalarUM2 <- defineUM(uncertain = TRUE, distribution = "norm",
                      distr_param = c(3, 2), id="Var2")
scalarUM3 <- defineUM(uncertain = TRUE, distribution = "norm",
                      distr_param = c(10, 2.5), id="Var3")                
myMUM <- defineMUM(UMlist = list(scalarUM, scalarUM2, scalarUM3), 
               matrix(c(1,0.7,0.2,0.7,1,0.5,0.2,0.5,1), nrow = 3, ncol = 3))
class(myMUM)




