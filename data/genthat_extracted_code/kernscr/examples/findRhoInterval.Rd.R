library(kernscr)


### Name: findRhoInterval
### Title: Find an interval contraining the rho parameter for a non linear
###   kernel
### Aliases: findRhoInterval

### ** Examples


## First generate some Data
feat_m_fun <- function(X){
 sin(X[,1]+X[,2]^2)-1
}
feat_d_fun <-  function(X){
 (X[,4]-X[,5])^2/8
}
mydata <- sim_SCR_data(data_size = 400, ncol_gene_mat = 20, feat_m = feat_m_fun,
                      feat_d = feat_d_fun, mu_cen = 30, cov=0.5)

#initial range
ind_gene <- c(7:ncol(mydata))
my_rho_init <- seq(0.01, 20, length=300)*length(ind_gene)
range(my_rho_init)

## Not run: 
##D # compute the interval for rho
##D rho_set <- findRhoInterval(tZ=t(mydata[,ind_gene]), rho_init = my_rho_init, kernel="gaussian")
##D rho_set
##D range(my_rho_init) # good to check that the interval produced here is strictly contained in rho_init
##D # otherwise, expand rho.init and rerun
##D 
##D #rhos <- exp(seq(log(rho_set[1]),log(rho_set[2]), length=50))
## End(Not run)



