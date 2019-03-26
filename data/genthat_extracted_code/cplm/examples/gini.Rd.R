library(cplm)


### Name: gini
### Title: The Gini index
### Aliases: gini
### Keywords: models

### ** Examples

## Not run: 
##D 
##D # Let's fit a series of models and compare them using the Gini index
##D da <- subset(AutoClaim, IN_YY == 1)
##D da <- transform(da, CLM_AMT = CLM_AMT / 1000)
##D                     
##D P1 <- cpglm(CLM_AMT ~ 1, data = da, offset = log(NPOLICY))
##D 
##D 
##D P2 <- cpglm(CLM_AMT ~ factor(CAR_USE) + factor(REVOLKED) + 
##D               factor(GENDER) + factor(AREA) + 
##D               factor(MARRIED) + factor(CAR_TYPE),
##D             data = da, offset = log(NPOLICY))
##D 
##D P3 <- cpglm(CLM_AMT ~ factor(CAR_USE) + factor(REVOLKED) + 
##D               factor(GENDER) + factor(AREA) + 
##D               factor(MARRIED) + factor(CAR_TYPE) +
##D               TRAVTIME + MVR_PTS + INCOME,
##D             data = da, offset = log(NPOLICY))
##D 
##D da <- transform(da, P1 = fitted(P1), P2 = fitted(P2), P3 = fitted(P3))
##D                 
##D # compute the Gini indices
##D gg <- gini(loss = "CLM_AMT", score  = paste("P", 1:3, sep = ""), 
##D            data = da)
##D gg
##D            
##D # plot the Lorenz curves 
##D theme_set(theme_bw())
##D plot(gg)
##D plot(gg, overlay = FALSE)
##D 
## End(Not run)



