library(mirt)


### Name: mirt.model
### Title: Specify model loadings
### Aliases: mirt.model

### ** Examples


## Not run: 
##D 
##D # interactively through the console (not run)
##D #model <- mirt.model()
##D #  F1 = 1,2,3,4-10
##D #  F2 = 10-20
##D #  (F1*F2) = 1,2,3,4-10
##D #  COV = F1*F2
##D 
##D 
##D #Or alternatively with a string input
##D s <- 'F1 = 1,2,3,4-10
##D       F2 = 10-20
##D       (F1*F2) = 1,2,3,4-10
##D       COV = F1*F2'
##D model <- mirt.model(s)
##D 
##D # strings can also be passed to the estimation functions directly,
##D #   which silently calls mirt.model(). E.g., using the string above:
##D # mod <- mirt(data, s)
##D 
##D 
##D #Q-matrix specification
##D Q <- matrix(c(1,1,1,0,0,0,0,0,0,1,1,1), ncol=2, dimnames = list(NULL, c('Factor1', 'Factor2')))
##D COV <- matrix(c(FALSE, TRUE, TRUE, FALSE), 2)
##D model <- mirt.model(Q, COV=COV)
##D 
##D ## constrain various items slopes and all intercepts in single group model to be equal,
##D #   and use a log-normal prior for all the slopes
##D s <- 'F = 1-10
##D       CONSTRAIN = (1-3, 5, 6, a1), (1-10, d)
##D       PRIOR = (1-10, a1, lnorm, .2, .2)'
##D model <- mirt.model(s)
##D 
##D 
##D ## constrain various items slopes and intercepts across groups for use in multipleGroup(),
##D #  and constrain first two slopes within 'group1' to be equal
##D s <- 'F = 1-10
##D       CONSTRAIN = (1-2, a1)
##D       CONSTRAINB = (1-3, 5, 6, a1), (1-10, d)'
##D model <- mirt.model(s)
##D 
##D 
##D ## specify model using raw item names
##D data(data.read, package = 'sirt')
##D dat <- data.read
##D 
##D # syntax with variable names
##D mirtsyn2 <- "
##D        F1 = A1,B2,B3,C4
##D        F2 = A1-A4,C2,C4
##D        MEAN = F1
##D        COV = F1*F1, F1*F2
##D        CONSTRAIN=(A2-A4,a2),(A3,C2,d)
##D        PRIOR = (C3,A2-A4,a2,lnorm, .2, .2),(B3,d,norm,0,.0001)"
##D # create a mirt model
##D mirtmodel <- mirt.model(mirtsyn2, itemnames=dat)
##D # or equivalently:
##D # mirtmodel <- mirt.model(mirtsyn2, itemnames=colnames(dat))
##D 
##D # mod <- mirt(dat , mirtmodel)
##D 
##D     
## End(Not run)



