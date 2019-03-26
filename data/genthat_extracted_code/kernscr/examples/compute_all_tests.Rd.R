library(kernscr)


### Name: compute_all_tests
### Title: Testing pathway risk association
### Aliases: compute_all_tests

### ** Examples


## First generate some Data
feat_m_fun <- function(X){
 sin(X[,1]+X[,2]^2)-1
}
feat_d_fun <-  function(X){
 (X[,4]-X[,5])^2/8
}
mydata <- sim_SCR_data(data_size = 400, ncol_gene_mat = 20, feat_m = feat_m_fun,
                      feat_d = feat_d_fun, mu_cen = 40, cov=0.5)

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
##D rhos <- exp(seq(log(rho_set[1]),log(rho_set[2]), length=50))
##D 
##D # run the tests with Gaussian kernel
##D compute_all_tests(data = mydata, num_perts=1000, rho=rhos, kernel="gaussian")
##D # run the tests with linear kernel
##D compute_all_tests(data=mydata, num_perts=1000, kernel="linear")
## End(Not run)




