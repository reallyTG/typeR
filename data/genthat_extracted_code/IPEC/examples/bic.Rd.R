library(IPEC)


### Name: bic
### Title: Bayesian Information Criterion (BIC)
### Aliases: bic

### ** Examples

#### Example #####################################################################################
data(leaves)
attach(leaves)
# Choose a geographical population (see Table S1 in Wang et al. [2018] for details)
# Wang, P., Ratkowsky, D.A., Xiao, X., Yu, X., Su, J., Zhang, L. and Shi, P. 
#   (2018) Taylor's power law for leaf bilateral symmetry. Forests 9, 500. doi: 10.3390/f9080500
# 1: AJ; 2: HN; 3: HW; 4: HZ; 5: JD; 
# 6: JS; 7: SC; 8: TC; 9: TT; 10: TX
ind <- 1
L   <- Length[PopuCode == ind]
W   <- Width[PopuCode == ind] 
A   <- Area[PopuCode == ind]

# Define a model y = a*(x1*x2), where a is a parameter to be estimated
propor <- function(theta, x){
    a  <- theta[1]
    x1 <- x[,1]
    x2 <- x[,2]
    a*x1*x2
}

# Define a model y = a*(x1^b)*(x2^c), where a, b and c are parameters to be estimated    
threepar <- function(theta, x){
    a  <- theta[1]
    b  <- theta[2]
    c  <- theta[3]
    x1 <- x[,1]
    x2 <- x[,2]
    a*x1^b*x2^c
}

# Define a model y = a*x^b, where a and b are parameters to be estimated    
twopar <- function(theta, x){
    a  <- theta[1]
    b  <- theta[2]
    a*x^b
}

## Not run: 
##D   A1 <- fitIPEC(propor, x=cbind(L, W), y=A, fig.opt=FALSE,
##D             ini.val=list(seq(0.1, 1.5, by=0.1)))
##D   B1 <- curvIPEC(propor, theta=A1$par, x=cbind(L, W), y=A)    
##D   A2 <- fitIPEC(threepar, x=cbind(L, W), y=A, fig.opt=FALSE,
##D             ini.val=list(A1$par, seq(0.5, 1.5, by=0.1), seq(0.5, 1.5, by=0.1)))    
##D   B2 <- curvIPEC(threepar, theta=A2$par, x=cbind(L, W), y=A)
##D   A3 <- fitIPEC(twopar, x=L, y=A, fig.opt=FALSE,
##D                 ini.val=list(1, seq(0.5, 1.5, by=0.05)))    
##D   B3 <- curvIPEC(twopar, theta=A3$par, x=L, y=A)
##D   A4 <- fitIPEC(twopar, x=W, y=A, fig.opt=FALSE,
##D                 ini.val=list(1, seq(0.5, 1.5, by=0.05)))    
##D   B4 <- curvIPEC(twopar, theta=A4$par, x=W, y=A)
##D   aic(A1, A2, A3, A4)
##D   bic(A1, A2, A3, A4)
## End(Not run)
##################################################################################################



