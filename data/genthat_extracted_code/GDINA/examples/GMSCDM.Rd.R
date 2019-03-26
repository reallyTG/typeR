library(GDINA)


### Name: GMSCDM
### Title: Estimating multiple-strategy cognitive diagnosis models
### Aliases: GMSCDM

### ** Examples

## Not run: 
##D ##################
##D #
##D # data simulation
##D #
##D ##################
##D set.seed(123)
##D msQ <- matrix(
##D c(1,1,0,1,
##D 1,2,1,0,
##D 2,1,1,0,
##D 3,1,0,1,
##D 4,1,1,1,
##D 5,1,1,1),6,4,byrow = T)
##D # J x L - 00,10,01,11
##D LC.prob <- matrix(c(
##D 0.2,0.7727,0.5889,0.8125,
##D 0.1,0.9,0.1,0.9,
##D 0.1,0.1,0.8,0.8,
##D 0.2,0.5,0.4,0.7,
##D 0.2,0.4,0.7,0.9),5,4,byrow=TRUE)
##D N <- 10000
##D att <- sample(1:4,N,replace=TRUE)
##D dat <- 1*(t(LC.prob[,att])>matrix(runif(N*5),N,5))
##D 
##D 
##D est <- GMSCDM(dat,msQ)
##D # item response function
##D est$IRF
##D # strategy specific IRF
##D est$sIRF
##D 
##D 
##D ################################
##D #
##D # Example 14 from GDINA function
##D #
##D ################################
##D Q <- matrix(c(1,1,1,1,0,
##D 1,2,0,1,1,
##D 2,1,1,0,0,
##D 3,1,0,1,0,
##D 4,1,0,0,1,
##D 5,1,1,0,0,
##D 5,2,0,0,1),ncol = 5,byrow = TRUE)
##D d <- list(
##D   item1=c(0.2,0.7),
##D   item2=c(0.1,0.6),
##D   item3=c(0.2,0.6),
##D   item4=c(0.2,0.7),
##D   item5=c(0.1,0.8))
##D 
##D   set.seed(123)
##D sim <- simGDINA(N=1000,Q = Q, delta.parm = d,
##D                model = c("MSDINA","MSDINA","DINA",
##D                          "DINA","DINA","MSDINA","MSDINA"))
##D 
##D # simulated data
##D dat <- extract(sim,what = "dat")
##D # estimation
##D # MSDINA need to be specified for each strategy
##D est <- GDINA(dat,Q,model = c("MSDINA","MSDINA","DINA",
##D                              "DINA","DINA","MSDINA","MSDINA"),
##D              control = list(conv.type = "neg2LL",conv.crit = .01))
##D 
##D # Approximate the MS-DINA model using GMS DINA model
##D est2 <- GMSCDM(dat, Q, model = "rDINA", s = 10,
##D                control = list(conv.type = "neg2LL",conv.crit = .01))
## End(Not run)





