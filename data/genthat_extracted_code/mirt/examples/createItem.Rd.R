library(mirt)


### Name: createItem
### Title: Create a user defined item with correct generic functions
### Aliases: createItem
### Keywords: createItem

### ** Examples


## Not run: 
##D 
##D name <- 'old2PL'
##D par <- c(a = .5, b = -2)
##D est <- c(TRUE, TRUE)
##D P.old2PL <- function(par,Theta, ncat){
##D      a <- par[1]
##D      b <- par[2]
##D      P1 <- 1 / (1 + exp(-1*a*(Theta - b)))
##D      cbind(1-P1, P1)
##D }
##D 
##D x <- createItem(name, par=par, est=est, P=P.old2PL)
##D 
##D #So, let's estimate it!
##D dat <- expand.table(LSAT7)
##D sv <- mirt(dat, 1, c(rep('2PL',4), 'old2PL'), customItems=list(old2PL=x), pars = 'values')
##D tail(sv) #looks good
##D mod <- mirt(dat, 1, c(rep('2PL',4), 'old2PL'), customItems=list(old2PL=x))
##D coef(mod)
##D mod2 <- mirt(dat, 1, c(rep('2PL',4), 'old2PL'), customItems=list(old2PL=x), method = 'MHRM')
##D coef(mod2)
##D 
##D # same definition as above, but using symbolic derivative computations
##D # (can be more accurate/stable)
##D xs <- createItem(name, par=par, est=est, P=P.old2PL, derivType = 'symbolic')
##D mod <- mirt(dat, 1, c(rep('2PL',4), 'old2PL'), customItems=list(old2PL=xs))
##D coef(mod, simplify=TRUE)
##D 
##D #several secondary functions supported
##D M2(mod, calcNull=FALSE)
##D itemfit(mod)
##D fscores(mod, full.scores=FALSE)
##D plot(mod)
##D 
##D # fit the same model, but specify gradient function explicitly (use of a browser() may be helpful)
##D gr <- function(x, Theta){
##D      # browser()
##D      a <- x@par[1]
##D      b <- x@par[2]
##D      P <- probtrace(x, Theta)
##D      PQ <- apply(P, 1, prod)
##D      r_P <- x@dat / P
##D      grad <- numeric(2)
##D      grad[2] <- sum(-a * PQ * (r_P[,2] - r_P[,1]))
##D      grad[1] <- sum((Theta - b) * PQ * (r_P[,2] - r_P[,1]))
##D 
##D      ## check with internal numerical form to be safe
##D      # numerical_deriv(mirt:::EML, x@par[x@est], obj=x, Theta=Theta)
##D      grad
##D }
##D 
##D x <- createItem(name, par=par, est=est, P=P.old2PL, gr=gr)
##D mod <- mirt(dat, 1, c(rep('2PL',4), 'old2PL'), customItems=list(old2PL=x))
##D coef(mod, simplify=TRUE)
##D 
##D ###non-linear
##D name <- 'nonlin'
##D par <- c(a1 = .5, a2 = .1, d = 0)
##D est <- c(TRUE, TRUE, TRUE)
##D P.nonlin <- function(par,Theta, ncat=2){
##D      a1 <- par[1]
##D      a2 <- par[2]
##D      d <- par[3]
##D      P1 <- 1 / (1 + exp(-1*(a1*Theta + a2*Theta^2 + d)))
##D      cbind(1-P1, P1)
##D }
##D 
##D x2 <- createItem(name, par=par, est=est, P=P.nonlin)
##D 
##D mod <- mirt(dat, 1, c(rep('2PL',4), 'nonlin'), customItems=list(nonlin=x2))
##D coef(mod)
##D 
##D ###nominal response model (Bock 1972 version)
##D Tnom.dev <- function(ncat) {
##D    T <- matrix(1/ncat, ncat, ncat - 1)
##D    diag(T[-1, ]) <-  diag(T[-1, ]) - 1
##D    return(T)
##D }
##D 
##D name <- 'nom'
##D par <- c(alp=c(3,0,-3),gam=rep(.4,3))
##D est <- rep(TRUE, length(par))
##D P.nom <- function(par, Theta, ncat){
##D    alp <- par[1:(ncat-1)]
##D    gam <- par[ncat:length(par)]
##D    a <- Tnom.dev(ncat) %*% alp
##D    c <- Tnom.dev(ncat) %*% gam
##D    z <- matrix(0, nrow(Theta), ncat)
##D    for(i in 1:ncat)
##D        z[,i] <- a[i] * Theta + c[i]
##D    P <- exp(z) / rowSums(exp(z))
##D    P
##D }
##D 
##D nom1 <- createItem(name, par=par, est=est, P=P.nom)
##D nommod <- mirt(Science, 1, 'nom1', customItems=list(nom1=nom1))
##D coef(nommod)
##D Tnom.dev(4) %*% coef(nommod)[[1]][1:3] #a
##D Tnom.dev(4) %*% coef(nommod)[[1]][4:6] #d
##D 
## End(Not run)



