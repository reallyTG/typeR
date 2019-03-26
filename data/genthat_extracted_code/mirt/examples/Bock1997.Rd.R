library(mirt)


### Name: Bock1997
### Title: Description of Bock 1997 data
### Aliases: Bock1997
### Keywords: data

### ** Examples


## Not run: 
##D dat <- expand.table(Bock1997)
##D head(dat)
##D mod <- mirt(dat, 1, 'nominal')
##D 
##D #reproduce table 3 in Bock (1997)
##D fs <- round(fscores(mod, verbose = FALSE, full.scores = FALSE)[,c('F1','SE_F1')],2)
##D fttd <- residuals(mod, type = 'exp')
##D table <- data.frame(fttd[,-ncol(fttd)], fs)
##D table
##D 
##D mod <- mirt(dat, 1, 'nominal')
##D coef(mod)
##D 
##D  
## End(Not run)



