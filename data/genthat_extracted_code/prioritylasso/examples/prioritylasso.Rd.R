library(prioritylasso)


### Name: prioritylasso
### Title: Patient outcome prediction based on multi-omics data taking
###   practicioners' preferences into account
### Aliases: prioritylasso

### ** Examples

# gaussian
  prioritylasso(X = matrix(rnorm(50*500),50,500), Y = rnorm(50), family = "gaussian",
                type.measure = "mse", blocks = list(bp1=1:75, bp2=76:200, bp3=201:500),
                max.coef = c(Inf,8,5), block1.penalization = TRUE,
                lambda.type = "lambda.min", standardize = TRUE, nfolds = 5, cvoffset = FALSE)
## Not run: 
##D   # cox
##D   # simulation of survival data:
##D   n <- 50;p <- 300
##D   nzc <- trunc(p/10)
##D   x <- matrix(rnorm(n*p), n, p)
##D   beta <- rnorm(nzc)
##D   fx <- x[, seq(nzc)]%*%beta/3
##D   hx <- exp(fx)
##D   # survival times:
##D   ty <- rexp(n,hx)
##D   # censoring indicator:
##D   tcens <- rbinom(n = n,prob = .3,size = 1)
##D   library(survival)
##D   y <- Surv(ty, 1-tcens)
##D   blocks <- list(bp1=1:20, bp2=21:200, bp3=201:300)
##D   # run prioritylasso:
##D   prioritylasso(x, y, family = "cox", type.measure = "deviance", blocks = blocks,
##D                 block1.penalization = TRUE, lambda.type = "lambda.min", standardize = TRUE,
##D                 nfolds = 5)
##D 
##D   # binomial
##D   # using pl_data:
##D   prioritylasso(X = pl_data[,1:1028], Y = pl_data[,1029], family = "binomial", type.measure = "auc",
##D                 blocks = list(bp1=1:4, bp2=5:9, bp3=10:28, bp4=29:1028), standardize = FALSE)
## End(Not run)




