library(mirt)


### Name: imputeMissing
### Title: Imputing plausible data for missing values
### Aliases: imputeMissing
### Keywords: data impute

### ** Examples

## Not run: 
##D dat <- expand.table(LSAT7)
##D (original <- mirt(dat, 1))
##D NAperson <- sample(1:nrow(dat), 20, replace = TRUE)
##D NAitem <- sample(1:ncol(dat), 20, replace = TRUE)
##D for(i in 1:20)
##D     dat[NAperson[i], NAitem[i]] <- NA
##D (mod <- mirt(dat, 1))
##D scores <- fscores(mod, method = 'MAP')
##D 
##D #re-estimate imputed dataset (good to do this multiple times and average over)
##D fulldata <- imputeMissing(mod, scores)
##D (fullmod <- mirt(fulldata, 1))
##D 
##D #with multipleGroup
##D set.seed(1)
##D group <- sample(c('group1', 'group2'), 1000, TRUE)
##D mod2 <- multipleGroup(dat, 1, group, TOL=1e-2)
##D fs <- fscores(mod2)
##D fulldata2 <- imputeMissing(mod2, fs)
##D 
## End(Not run)



