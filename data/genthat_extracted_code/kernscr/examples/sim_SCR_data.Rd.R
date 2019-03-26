library(kernscr)


### Name: sim_SCR_data
### Title: Data Simulation Function
### Aliases: sim_SCR_data

### ** Examples

feat_m_fun <- function(X){
 sin(X[,1]+X[,2]^2)-1
}
feat_d_fun <-  function(X){
 (X[,4]-X[,5])^2/8
}
mydata <- sim_SCR_data(data_size = 400, ncol_gene_mat = 20, feat_m = feat_m_fun,
                      feat_d = feat_d_fun, mu_cen = 30, cov=0.5)
head(mydata)
## how many experience both events
mean(mydata[,"DeltaR"]==1 & mydata[,"DeltaD"]==1)
## how many only recur
mean(mydata[,"DeltaR"]==1 & mydata[,"DeltaD"]==0)
## how many only die
mean(mydata[,"DeltaR"]==2 & mydata[,"DeltaD"]==1)
## how many are censored
mean(mydata[,"DeltaR"]==0 & mydata[,"DeltaD"]==0)





