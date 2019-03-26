library(copBasic)


### Name: rhoCOP
### Title: The Spearman's Rho of a Copula
### Aliases: rhoCOP
### Keywords: copula (characteristics) copula (properties) Joe (2014)
###   Examples and Exercises

### ** Examples

rhoCOP(cop=PSP)             # 0.4784176
## Not run: 
##D rhoCOP(cop=PSP, brute=TRUE) # 0.4684063
##D # CPU heavy example showing that the dual-integration (fast) results in
##D # a Spearman's Rho that mimics a sample version
##D do_rho <- function(n) {
##D    uv <- simCOP(n=n, cop=PSP, ploton=FALSE, points=FALSE)
##D    return(cor(uv$U, uv$V, method="spearman"))
##D }
##D rhos <- replicate(100, do_rho(1000))
##D rho_sample <- mean(rhos); print(rho_sample) # 0.472661
## End(Not run)

## Not run: 
##D para <- list(cop1=PLACKETTcop,  cop2=PLACKETTcop,
##D              para1=0.00395,    para2=4.67,     alpha=0.9392, beta=0.5699)
##D rhoCOP(cop=composite2COP, para=para) # -0.5924796
##D 
##D para <- list(cop1=PLACKETTcop,  cop2=PLACKETTcop,
##D              para1=0.14147,    para2=20.96,    alpha=0.0411, beta=0.6873)
##D rhoCOP(cop=composite2COP, para=para) # 0.2818874
##D 
##D para <- list(cop1=PLACKETTcop,  cop2=PLACKETTcop,
##D              para1=0.10137,     para2=4492.87, alpha=0.0063, beta=0.0167)
##D rhoCOP(cop=composite2COP, para=para)             # 0.9812919
##D rhoCOP(cop=composite2COP, para=para, brute=TRUE) # 0.9752155
## End(Not run)

## Not run: 
##D # This is the same composited copula used in a highly asymmetric multi-modal
##D # plotting example under densityCOPplot(). Let us use that copula as a means to
##D # check on the Spearman's Rho from the alternative formulations from Joe (2014).
##D para <- list(alpha=0.15, beta=0.90, kappa=0.06, gamma=0.96,
##D              cop1=GHcop, cop2=PLACKETTcop, para1=5.5, para2=0.07)
##D "rhoCOPbyJoe21" <- function(cop=NULL, para=NULL, ...) { # Joe (2014, eq. 2.48)
##D    myint <- NULL
##D    try(myint <- integrate(function(u) {
##D        sapply(u,function(u) { integrate(function(v) {
##D        u * derCOP( u, v, cop=cop, para=para, ...)},  0, 1)$value })}, 0, 1))
##D    ifelse(is.null(myint), return(NA), return(3 - 12*myint$value))
##D }
##D "rhoCOPbyJoe12" <- function(cop=NULL, para=NULL, ...) { # Not in Joe (2014)
##D    myint <- NULL
##D    try(myint <- integrate(function(u) {
##D        sapply(u,function(u) { integrate(function(v) {
##D        v * derCOP2( u, v, cop=cop, para=para, ...)}, 0, 1)$value })}, 0, 1))
##D    ifelse(is.null(myint), return(NA), return(3 - 12*myint$value))
##D }
##D rhoCOP(       cop=composite2COP, para=para) # 0.1031758
##D rhoCOPbyJoe21(cop=composite2COP, para=para) # 0.1031803
##D rhoCOPbyJoe12(cop=composite2COP, para=para) # 0.1031532
## End(Not run)



