library(xergm)


### Name: xergm-package
### Title: Extensions of Exponential Random Graph Models (ERGM)
### Aliases: xergm-package

### ** Examples

## Not run: 
##D # example 1: temporal exponential random graph model (see ?btergm)
##D library("statnet")
##D set.seed(5)
##D 
##D networks <- list()
##D for(i in 1:10){            # create 10 random networks with 10 actors
##D   mat <- matrix(rbinom(100, 1, .25), nrow = 10, ncol = 10)
##D   diag(mat) <- 0           # loops are excluded
##D   nw <- network(mat)       # create network object
##D   networks[[i]] <- nw      # add network to the list
##D }
##D 
##D covariates <- list()
##D for (i in 1:10) {          # create 10 matrices as covariate
##D   mat <- matrix(rnorm(100), nrow = 10, ncol = 10)
##D   covariates[[i]] <- mat   # add matrix to the list
##D }
##D 
##D fit <- btergm(networks ~ edges + istar(2) +
##D     edgecov(covariates), R = 100)
##D 
##D summary(fit)               # show estimation results
##D 
##D # example 2: temporal network autocorrelation model (see ?tnam)
##D data("knecht")
##D delinquency <- as.data.frame(delinquency)
##D rownames(delinquency) <- letters
##D friendship[[3]][friendship[[3]] == 10] <- NA
##D friendship[[4]][friendship[[4]] == 10] <- NA
##D for (i in 1:length(friendship)) {
##D   rownames(friendship[[i]]) <- letters
##D }
##D sex <- demographics$sex
##D names(sex) <- letters
##D sex <- list(t1 = sex, t2 = sex, t3 = sex, t4 = sex)
##D religion <- demographics$religion
##D names(religion) <- letters
##D religion <- list(t1 = religion, t2 = religion, t3 = religion, 
##D     t4 = religion)
##D 
##D model1 <- tnam(
##D     delinquency ~ 
##D     covariate(sex, coefname = "sex") + 
##D     covariate(religion, coefname = "religion") + 
##D     covariate(delinquency, lag = 1, exponent = 1) + 
##D     netlag(delinquency, friendship) + 
##D     netlag(delinquency, friendship, pathdist = 2, decay = 1) + 
##D     netlag(delinquency, friendship, lag = 1) + 
##D     degreedummy(friendship, deg = 0, reverse = TRUE) + 
##D     centrality(friendship, type = "betweenness"), 
##D     re.node = TRUE, time.linear = TRUE
##D )
##D summary(model1)
## End(Not run)



