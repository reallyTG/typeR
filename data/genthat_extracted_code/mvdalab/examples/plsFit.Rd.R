library(mvdalab)


### Name: plsFit
### Title: Partial Least Squares Regression
### Aliases: plsFit mvdareg summary.mvdareg summary.mvdareg.default

### ** Examples

###  PLS MODEL FIT WITH method = 'bidiagpls' and validation = 'oob', i.e. bootstrapping ###
data(Penta)
## Number of bootstraps set to 300 to demonstrate flexibility
## Use a minimum of 1000 (default) for results that support bootstraping
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1], method = "bidiagpls",
               ncomp = 2, validation = "oob", boots = 300)
summary(mod1) #Model summary

###  PLS MODEL FIT WITH method = 'bidiagpls' and validation = 'loo', i.e. leave-one-out CV ###
## Not run: 
##D mod2 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1], method = "bidiagpls",
##D                ncomp = 2, validation = "loo")
##D summary(mod2) #Model summary
## End(Not run)

###  PLS MODEL FIT WITH method = 'bidiagpls' and validation = 'none', i.e. no CV is performed ###
## Not run: 
##D mod3 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1], method = "bidiagpls",
##D                ncomp = 2, validation = "none")
##D summary(mod3) #Model summary
## End(Not run)
###  PLS MODEL FIT WITH method = 'wrtpls' and validation = 'none', i.e. WRT-PLS is performed ###
## Not run: 
##D mod4 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
##D                method = "wrtpls", validation = "none")
##D summary(mod4) #Model summary
##D plot.wrtpls(mod4)
## End(Not run)



