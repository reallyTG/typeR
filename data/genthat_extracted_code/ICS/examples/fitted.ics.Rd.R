library(ICS)


### Name: fitted.ics
### Title: Fitted Values of an ICS Object
### Aliases: fitted.ics fitted-method fitted,ics-method
### Keywords: models

### ** Examples

    set.seed(123456)
    X1 <- rmvnorm(250, rep(0,8), diag(c(rep(1,6),0.04,0.04)))
    X2 <- rmvnorm(50, c(rep(0,6),2,0), diag(c(rep(1,6),0.04,0.04)))
    X3 <- rmvnorm(200, c(rep(0,7),2), diag(c(rep(1,6),0.04,0.04)))

    X.comps <- rbind(X1,X2,X3)
    A <- matrix(rnorm(64),nrow=8)
    X <- X.comps %*% t(A)

    ics.X.1 <- ics(X)
    fitted(ics.X.1)
    fitted(ics.X.1,index=c(1,2,3,6,7,8))
    
    rm(.Random.seed)



