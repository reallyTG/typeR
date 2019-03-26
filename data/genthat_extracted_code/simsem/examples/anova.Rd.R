library(simsem)


### Name: anova
### Title: Provide a comparison of nested models and nonnested models
###   across replications
### Aliases: anova,SimResult-method

### ** Examples

## Not run: 
##D loading1 <- matrix(0, 6, 1)
##D loading1[1:6, 1] <- NA
##D loading2 <- loading1
##D loading2[6,1] <- 0
##D LY1 <- bind(loading1, 0.7)
##D LY2 <- bind(loading2, 0.7)
##D RPS <- binds(diag(1))
##D RTE <- binds(diag(6))
##D CFA.Model1 <- model(LY = LY1, RPS = RPS, RTE = RTE, modelType="CFA")
##D CFA.Model2 <- model(LY = LY2, RPS = RPS, RTE = RTE, modelType="CFA")
##D 
##D # We make the examples running only 5 replications to save time.
##D # In reality, more replications are needed.
##D # Need to make sure that both simResult calls have the same seed!
##D Output1 <- sim(5, n=500, model=CFA.Model1, generate=CFA.Model1, seed=123567)
##D Output2 <- sim(5, n=500, model=CFA.Model2, generate=CFA.Model1, seed=123567)
##D anova(Output1, Output2)
##D 
##D # The example when the sample size is varying
##D Output1b <- sim(NULL, n=seq(50, 500, 50), model=CFA.Model1, generate=CFA.Model1, seed=123567)
##D Output2b <- sim(NULL, n=seq(50, 500, 50), model=CFA.Model2, generate=CFA.Model1, seed=123567)
##D anova(Output1b, Output2b)
## End(Not run)



