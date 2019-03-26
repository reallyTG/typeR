library(MuMIn)


### Name: QAIC
### Title: Quasi AIC or AICc
### Aliases: QAIC QAICc
### Keywords: models

### ** Examples

## Don't show: 
oop <- 
## End(Don't show)
options(na.action = "na.fail")

# Based on "example(predict.glm)", with one number changed to create
# overdispersion
budworm <- data.frame(
    ldose = rep(0:5, 2), sex = factor(rep(c("M", "F"), c(6, 6))),
    numdead = c(10, 4, 9, 12, 18, 20, 0, 2, 6, 10, 12, 16))
budworm$SF = cbind(numdead = budworm$numdead,
    numalive = 20 - budworm$numdead)

budworm.lg <- glm(SF ~ sex*ldose, data = budworm, family = binomial)
(chat <- deviance(budworm.lg) / df.residual(budworm.lg))

dredge(budworm.lg, rank = "QAIC", chat = chat)
dredge(budworm.lg, rank = "AIC")



## Not run: 
##D # A 'hacked' constructor for quasibinomial family object that allows for
##D # ML estimation
##D hacked.quasibinomial <- function(...) {
##D     res <- quasibinomial(...)
##D     res$aic <- binomial(...)$aic
##D     res
##D }
##D QAIC(update(budworm.lg, family = hacked.quasibinomial), chat = chat)
## End(Not run)
## Don't show: 
options(oop)
## End(Don't show)



