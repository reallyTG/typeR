library(PLmixed)


### Name: PLmixed
### Title: Fit GLMM with Factor Structure
### Aliases: PLmixed
### Keywords: Factor GLLAMM GLMM IRT

### ** Examples

data("IRTsim") # Load the IRTsim data

IRTsub <- IRTsim[IRTsim$item < 4, ] # Select items 1-3
set.seed(12345)
IRTsub <- IRTsub[sample(nrow(IRTsub), 300), ] # Randomly sample 300 responses

IRTsub <- IRTsub[order(IRTsub$item), ] # Order by item
irt.lam = c(1, NA, NA) # Specify the lambda matrix

# Below, the # in front of family = binomial can be removed to change the response distribution
# to binomial, where the default link function is logit.

irt.model <- PLmixed(y ~ 0 + as.factor(item) + (0 + abil.sid |sid) +(0 + abil.sid |school),
                     data = IRTsub, load.var = c("item"), # family = binomial,
                     factor = list(c("abil.sid")), lambda = list(irt.lam))
summary(irt.model)

## Not run: 
##D # A more time-consuming example.
##D # ~ 5-10 minutes
##D 
##D data("KYPSsim") # Load the KYPSsim data
##D 
##D kyps.lam <- rbind(c( 1,  0),  # Specify the lambda matrix
##D                   c(NA,  0),
##D                   c(NA,  1),
##D                   c(NA, NA))
##D 
##D kyps.model <- PLmixed(esteem ~ as.factor(time) +  (0 + hs | hid)
##D                       + (0 + ms | mid) + (1 | sid), data = KYPSsim,
##D                       factor = list(c("ms", "hs")), load.var = c("time"),
##D                       lambda = list(kyps.lam))
##D summary(kyps.model)
##D 
##D data("JUDGEsim")
##D JUDGEsim <- JUDGEsim[order(JUDGEsim$item), ] # Order by item
##D unique(JUDGEsim$item)
##D 
##D # Specify Lambda matrix
##D judge.lam <- rbind(c( 1,  0,  1,  0,  0,  0),
##D                    c(NA,  0, NA,  0,  0,  0),
##D                    c(NA,  0, NA,  0,  0,  0),
##D                    c( 0,  1,  0,  1,  0,  0),
##D                    c( 0, NA,  0, NA,  0,  0),
##D                    c( 0, NA,  0, NA,  0,  0),
##D                    c( 0,  0,  0,  0,  1,  0),
##D                    c( 0,  0,  0,  0, NA,  0),
##D                    c( 0,  0,  0,  0, NA,  0),
##D                    c( 0,  0,  0,  0,  0,  1),
##D                    c( 0,  0,  0,  0,  0, NA),
##D                    c( 0,  0,  0,  0,  0, NA))
##D 
##D # Conduct analysis
##D judge.example <- PLmixed(response ~ 0 + as.factor(item) + (1 | class)
##D                          + (0 + trait1.t + trait2.t + trait1.s + trait2.s | stu)
##D                          + (0 + teacher1 + teacher2 | tch), data = JUDGEsim,
##D                          lambda = list(judge.lam), load.var = "item",
##D                          factor = list(c("teacher1", "teacher2", "trait1.t",
##D                                          "trait2.t", "trait1.s", "trait2.s")))
##D 
##D summary(judge.example)
##D 
##D data("KYPSitemsim")
##D 
##D time.lam <- rbind(c( 1,  0),  # Specify time lambda matrix
##D                   c(NA,  0),
##D                   c(NA,  1),
##D                   c(NA, NA))
##D 
##D item.lam <- c(1, NA, NA, NA, NA, NA) # Specify item lambda matrix
##D 
##D KYPSitemsim$time2 <- (KYPSitemsim$time == 2) * 1
##D KYPSitemsim$time3 <- (KYPSitemsim$time == 3) * 1
##D KYPSitemsim$time4 <- (KYPSitemsim$time == 4) * 1
##D 
##D kyps.item.model <- PLmixed(response ~ 0 + as.factor(item) + lat.var:time2
##D                            + lat.var:time3 + lat.var:time4 + (0 + hs:lat.var | hid)
##D                            + (0 + ms:lat.var | mid) + (0 + lat.var:as.factor(time) | id),
##D                            data = KYPSitemsim, lambda = list(time.lam, item.lam),
##D                            factor = list(c("ms", "hs"), "lat.var"),
##D                            load.var = c("time", "item"))
##D 
##D summary(kyps.item.model)
##D 
## End(Not run)




