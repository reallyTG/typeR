library(brms)


### Name: gr
### Title: Set up basic grouping terms in 'brms'
### Aliases: gr

### ** Examples

## Not run: 
##D # model using basic lme4-style formula
##D fit1 <- brm(count ~ Trt + (1|patient), data = epilepsy)
##D summary(fit1)
##D 
##D # equivalent model using 'gr' which is called anyway internally
##D fit2 <- brm(count ~ Trt + (1|gr(patient)), data = epilepsy)
##D summary(fit2)
##D 
##D # include Trt as a by variable
##D fit3 <- brm(count ~ Trt + (1|gr(patient, by = Trt)), data = epilepsy)
##D summary(fit3)
## End(Not run)




