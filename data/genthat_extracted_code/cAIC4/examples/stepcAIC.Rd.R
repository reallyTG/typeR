library(cAIC4)


### Name: stepcAIC
### Title: Function to stepwise select the (generalized) linear mixed model
###   fitted via (g)lmer() or (generalized) additive (mixed) model fitted
###   via gamm4() with the smallest cAIC.
### Aliases: stepcAIC

### ** Examples


(fm3 <- lmer(strength ~ 1 + (1|sample) + (1|batch), Pastes))

fm3_step <- stepcAIC(fm3, direction = "backward", trace = TRUE, data = Pastes)

fm3_min <- lm(strength ~ 1, data=Pastes)

fm3_min_step <- stepcAIC(fm3_min, groupCandidates = c("batch", "sample"), 
direction="forward", data=Pastes, trace=TRUE)
fm3_min_step <- stepcAIC(fm3_min, groupCandidates = c("batch", "sample"), 
direction="both", data=Pastes, trace=TRUE)
# try using a nested group effect which is actually not nested -> warning
fm3_min_step <- stepcAIC(fm3_min, groupCandidates = c("batch", "sample", "batch/sample"), 
                         direction="both", data=Pastes, trace=TRUE)

Pastes$time <- 1:dim(Pastes)[1]
fm3_slope <- lmer(data=Pastes, strength ~ 1 + (1 + time | cask))

fm3_slope_step <- stepcAIC(fm3_slope,direction="backward", trace=TRUE, data=Pastes)



fm3_min <- lm(strength ~ 1, data=Pastes)

fm3_min_step <- stepcAIC(fm3_min,groupCandidates=c("batch","sample"),
direction="forward", data=Pastes,trace=TRUE)



fm3_inta <- lmer(strength ~ 1 + (1|sample:batch), data=Pastes)

fm3_inta_step <- stepcAIC(fm3_inta,groupCandidates=c("batch","sample"),
direction="forward", data=Pastes,trace=TRUE)

fm3_min_step2 <- stepcAIC(fm3_min,groupCandidates=c("cask","batch","sample"),
direction="forward", data=Pastes,trace=TRUE)

fm3_min_step3 <- stepcAIC(fm3_min,groupCandidates=c("cask","batch","sample"),
direction="both", data=Pastes,trace=TRUE)

## Not run: 
##D fm3_inta_step2 <- stepcAIC(fm3_inta,direction="backward", 
##D data=Pastes,trace=TRUE)
## End(Not run)

##### create own example


na <- 20
nb <- 25
n <- 400
a <- sample(1:na,400,replace=TRUE)
b <- factor(sample(1:nb,400,replace=TRUE))
x <- runif(n)
y <- 2 + 3 * x + a*.02 + rnorm(n) * .4
a <- factor(a)
c <- interaction(a,b)
y <- y + as.numeric(as.character(c))*5
df <- data.frame(y=y,x=x,a=a,b=b,c=c)

smallMod <- lm(y ~ x)

## Not run: 
##D # throw error
##D stepcAIC(smallMod, groupCandidates=c("a","b","c"), data=df, trace=TRUE, returnResult=FALSE)
##D 
##D smallMod <- lm(y ~ x, data=df)
##D 
##D # throw error
##D stepcAIC(smallMod, groupCandidates=c("a","b","c"), data=df, trace=TRUE, returnResult=FALSE)
##D 
##D # get it all right
##D mod <- stepcAIC(smallMod, groupCandidates=c("a","b","c"), 
##D                 data=df, trace=TRUE, 
##D                 direction="forward", returnResult=TRUE)
##D 
##D # make some more steps...
##D stepcAIC(smallMod, groupCandidates=c("a","b","c"), data=df, trace=TRUE, 
##D          direction="both", returnResult=FALSE)
##D 
##D mod1 <- lmer(y ~ x + (1|a), data=df)
##D 
##D stepcAIC(mod1, groupCandidates=c("b","c"), data=df, trace=TRUE, direction="forward")
##D stepcAIC(mod1, groupCandidates=c("b","c"), data=df, trace=TRUE, direction="both")
##D 
##D 
##D 
##D mod2 <- lmer(y ~ x + (1|a) + (1|c), data=df)
##D 
##D stepcAIC(mod2, data=df, trace=TRUE, direction="backward")
##D 
##D mod3 <- lmer(y ~ x + (1|a) + (1|a:b), data=df)
##D 
##D stepcAIC(mod3, data=df, trace=TRUE, direction="backward")
##D 
## End(Not run)




