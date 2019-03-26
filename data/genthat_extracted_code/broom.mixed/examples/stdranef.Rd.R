library(broom.mixed)


### Name: stdranef
### Title: Extract standard deviation of "random" effects from an
###   'MCMCglmm' object
### Aliases: stdranef

### ** Examples

## Not run: 
##D   # a simple MCMCglmm model
##D   data(PlodiaPO)
##D   PlodiaPO <- within(PlodiaPO, {
##D     PO2 <- cut(PO, quantile(PO, c(0, .33, .66, 1)))
##D     plate <- factor(plate)
##D   })
##D 
##D   m <- MCMCglmm(PO2 ~ 1, random = ~ FSfamily + plate,
##D     family = "ordinal", data = PlodiaPO,
##D     prior = list(
##D       R = list(V = 1, fix = 1),
##D       G = list(
##D         G1 = list(V = 1, nu = .002),
##D         G2 = list(V = 1, nu = .002)
##D       )
##D     ), verbose=FALSE, thin=1, pr=TRUE)
##D 
##D   # summary of the model
##D   summary(m)
##D 
##D   # examples of extracting standard deviations of
##D   # different random effects on the linear predictor metric
##D   # or after transformation to probabilities (only for ordinal)
##D   stdranef(m, which = list(1), type = "lp")
##D   stdranef(m, which = list(2), type = "lp")
##D   stdranef(m, which = list(1, 2, c(1, 2)), type = "lp")
##D   stdranef(m, type = "lp")
##D 
##D   ## error because no 3rd random effect
##D   #stdranef(m, which = list(1, 2, 3), type = "lp")
##D 
##D   stdranef(m, which = list("FSfamily", "plate"), type = "lp")
##D 
##D   # mean standard deviations on the probability metric
##D   # also the full distributions, if desired in the Data slot.
##D   res <- stdranef(m, type = "response")
##D   res$M # means
##D   hist(res$Data$FSfamily[, 1]) # histogram
## End(Not run)



