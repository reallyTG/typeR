library(mgm)


### Name: bwSelect
### Title: Select optimal bandwidth for time-varying MGMs and mVAR Models
### Aliases: bwSelect

### ** Examples


## Not run: 
##D 
##D 
##D ## A) bwSelect for tvmgm() 
##D 
##D # A.1) Generate noise data set
##D p <- 5
##D n <- 100
##D data_n <- matrix(rnorm(p*n), nrow=100)
##D head(data_n)
##D 
##D type <- c("c", "c", rep("g", 3))
##D level <- c(2, 2, 1, 1, 1)
##D x1 <- data_n[,1]
##D x2 <- data_n[,2]
##D data_n[x1>0,1] <- 1
##D data_n[x1<0,1] <- 0
##D data_n[x2>0,2] <- 1
##D data_n[x2<0,2] <- 0
##D 
##D head(data_n)
##D 
##D # A.2) Estimate optimal bandwidth parameter
##D 
##D bwobj_mgm <- bwSelect(data = data_n,
##D                       type = type,
##D                       level = level,
##D                       bwSeq = seq(0.05, 1, length=3),
##D                       bwFolds = 1,
##D                       bwFoldsize = 3,
##D                       modeltype = "mgm",
##D                       k = 3,
##D                       pbar = TRUE,
##D                       overparameterize = TRUE)
##D 
##D 
##D print.mgm(bwobj_mgm)
##D 
##D 
##D 
##D ## B) bwSelect for tvmVar() 
##D 
##D # B.1) Generate noise data set
##D 
##D p <- 5
##D n <- 100
##D data_n <- matrix(rnorm(p*n), nrow=100)
##D head(data_n)
##D 
##D type <- c("c", "c", rep("g", 3))
##D level <- c(2, 2, 1, 1, 1)
##D x1 <- data_n[,1]
##D x2 <- data_n[,2]
##D data_n[x1>0,1] <- 1
##D data_n[x1<0,1] <- 0
##D data_n[x2>0,2] <- 1
##D data_n[x2<0,2] <- 0
##D 
##D head(data_n)
##D 
##D # B.2) Estimate optimal bandwidth parameter
##D 
##D bwobj_mvar <- bwSelect(data = data_n,
##D                        type = type,
##D                        level = level,
##D                        bwSeq = seq(0.05, 1, length=3),
##D                        bwFolds = 1,
##D                        bwFoldsize = 3,
##D                        modeltype = "mvar",
##D                        lags = 1:3,
##D                        pbar = TRUE,
##D                        overparameterize = TRUE)
##D 
##D 
##D print.mgm(bwobj_mvar)
##D 
##D # For more examples see https://github.com/jmbh/mgmDocumentation
##D 
##D 
## End(Not run)




