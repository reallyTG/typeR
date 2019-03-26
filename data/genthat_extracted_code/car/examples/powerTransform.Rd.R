library(car)


### Name: powerTransform
### Title: Finding Univariate or Multivariate Power Transformations
### Aliases: powerTransform powerTransform.default powerTransform.lm
###   powerTransform.formula powerTransform.lmerMod
### Keywords: regression

### ** Examples

# Box Cox Method, univariate
summary(p1 <- powerTransform(cycles ~ len + amp + load, Wool))
# fit linear model with transformed response:
coef(p1, round=TRUE)
summary(m1 <- lm(bcPower(cycles, p1$roundlam) ~ len + amp + load, Wool))

# Multivariate Box Cox uses Highway1 data
summary(powerTransform(cbind(len, adt, trks, sigs1) ~ 1, Highway1))

# Multivariate transformation to normality within levels of 'htype'
summary(a3 <- powerTransform(cbind(len, adt, trks, sigs1) ~ htype, Highway1))

# test lambda = (0 0 0 -1)
testTransform(a3, c(0, 0, 0, -1))

# save the rounded transformed values, plot them with a separate
# color for each highway type
transformedY <- bcPower(with(Highway1, cbind(len, adt, trks, sigs1)),
                        coef(a3, round=TRUE))
## Not run: scatterplotMatrix( ~ transformedY|htype, Highway1) 

# With negative responses, use the bcnPower family
m2 <- lm(I1L1 ~ pool, LoBD)
summary(p2 <- powerTransform(m2, family="bcnPower"))
testTransform(p2, .5)
summary(powerTransform(update(m2, cbind(LoBD$I1L2, LoBD$I1L1) ~ .), family="bcnPower"))

## Not run: 
##D  
##D   # tajes a few seconds:
##D   # multivariate bcnPower, with 8 responses
##D   summary(powerTransform(update(m2, as.matrix(LoBD[, -1]) ~ .), family="bcnPower"))
##D   # multivariate bcnPower, fit with one iteration using starting values as estimates
##D   summary(powerTransform(update(m2, as.matrix(LoBD[, -1]) ~ .), family="bcnPower", itmax=1))
## End(Not run)

# mixed effects model
## Not run: 
##D   # uses the lme4 package
##D   data <- reshape(LoBD[1:20, ], varying=names(LoBD)[-1], direction="long", v.names="y")
##D   names(data) <- c("pool", "assay", "y", "id")
##D   data$assay <- factor(data$assay)
##D   require(lme4)
##D   m2 <- lmer(y ~ pool + (1|assay), data)
##D   summary(l2 <- powerTransform(m2, family="bcnPower", verbose=TRUE))
## End(Not run)



