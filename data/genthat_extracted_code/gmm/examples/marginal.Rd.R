library(gmm)


### Name: marginal
### Title: Marginal effects Summary
### Aliases: marginal marginal.ategel

### ** Examples

## We create some artificial data with unbalanced groups and binary outcome
genDat <- function(n)
    {
        eta=c(-1, .5, -.25, -.1)
        Z <- matrix(rnorm(n*4),ncol=4)
        b <- c(27.4, 13.7, 13.7, 13.7)
        bZ <- c(Z%*%b)
        Y1 <- as.numeric(rnorm(n, mean=210+bZ)>220)
        Y0 <- as.numeric(rnorm(n, mean=200-.5*bZ)>220)
        etaZ <- c(Z%*%eta)
        pZ <- exp(etaZ)/(1+exp(etaZ))
        T <- rbinom(n, 1, pZ)
        Y <- T*Y1+(1-T)*Y0
        X1 <- exp(Z[,1]/2)
        X2 <- Z[,2]/(1+exp(Z[,1]))
        X3 <- (Z[,1]*Z[,3]/25+0.6)^3
        X4 <- (Z[,2]+Z[,4]+20)^2
        data.frame(Y=Y, cbind(X1,X2,X3,X4), T=T)
    }

dat <- genDat(200)
res <- ATEgel(Y~T, ~X1+X2+X3+X4, data=dat, type="ET", family="logit")
summary(res)

marginal(res)




