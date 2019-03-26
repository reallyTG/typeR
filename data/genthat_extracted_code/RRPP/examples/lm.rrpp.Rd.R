library(RRPP)


### Name: lm.rrpp
### Title: Linear Model Evaluation with a Randomized Residual Permutation
###   Procedure
### Aliases: lm.rrpp
### Keywords: analysis

### ** Examples


# Examples use geometric morphometric data
# See the package, geomorph, for details about obtaining such data

data("PupfishHeads")
names(PupfishHeads)

# Head Size Analysis (Univariate)-------------------------------------------------------

# Note: lm.rrpp works best if one avoids functions within formulas
# Thus,

PupfishHeads$logHeadSize <- log(PupfishHeads$headSize)
names(PupfishHeads)

fit <- lm.rrpp(logHeadSize ~ sex + locality/year, SS.type = "I", data = PupfishHeads)
summary(fit)
anova(fit, effect.type = "F") # Maybe not most appropriate
anova(fit, effect.type = "Rsq") # Change effect type, but still not most appropriate

# Mixed-model approach (most appropriate, as year sampled is a random effect:

anova(fit, effect.type = "F", error = c("Residuals", "locality:year", "Residuals"))

# Change to Type III SS

fit <- lm.rrpp(logHeadSize ~ sex + locality/year, SS.type = "III", data = PupfishHeads)
summary(fit)
anova(fit, effect.type = "F", error = c("Residuals", "locality:year", "Residuals"))

# Coefficients Test

coef(fit, test = TRUE)

# Predictions (holding alternative effects constant)

sizeDF <- data.frame(sex = c("Female", "Male"))
rownames(sizeDF) <- c("Female", "Male")
sizePreds <- predict(fit, sizeDF)
summary(sizePreds)
plot(sizePreds)

# Diagnostics plots of residuals

plot(fit)

# Body Shape Analysis (Multivariate)----------------------------------------------------

data(Pupfish)
names(Pupfish)

# Note:

dim(Pupfish$coords) # highly multivariate!

Pupfish$logSize <- log(Pupfish$CS) # better to not have functions in formulas
names(Pupfish)

# Note: one should increase RRPP iterations but they are not used at all
# here for a fast example.  Generally, iter = 999 will take less
# than 1s for this example with a modern computer.

fit <- lm.rrpp(coords ~ logSize + Sex*Pop, SS.type = "I", 
data = Pupfish, print.progress = FALSE, iter = 0) 
summary(fit, formula = FALSE)
anova(fit) 
coef(fit, test = TRUE)

# Predictions (holding alternative effects constant)

shapeDF <- expand.grid(Sex = levels(Pupfish$Sex), Pop = levels(Pupfish$Pop))
rownames(shapeDF) <- paste(shapeDF$Sex, shapeDF$Pop, sep = ".")
shapeDF

shapePreds <- predict(fit, shapeDF)
summary(shapePreds)
summary(shapePreds, PC = TRUE)

# Plot prediction

plot(shapePreds, PC = TRUE)
plot(shapePreds, PC = TRUE, ellipse = TRUE)

# Diagnostics plots of residuals

plot(fit)

# PC-plot of fitted values

groups <- interaction(Pupfish$Sex, Pupfish$Pop)
plot(fit, type = "PC", pch = 19, col = as.numeric(groups))

# Regression-like plot

plot(fit, type = "regression", reg.type = "PredLine", 
    predictor = Pupfish$logSize, pch=19,
    col = as.numeric(groups))

# Body Shape Analysis (Distances)----------------------------------------------------

D <- dist(Pupfish$coords) # inter-observation distances
length(D)
Pupfish$D <- D

# Note: one should increase RRPP iterations but they are not used at all
# here for a fast example.  Generally, iter = 999 will take less
# than 1s for this example with a modern computer.

fitD <- lm.rrpp(D ~ logSize + Sex*Pop, SS.type = "I", 
data = Pupfish, print.progress = FALSE, iter = 0) 

# These should be the same:
summary(fitD, formula = FALSE)
summary(fit, formula = FALSE) 

# GLS Example (Univariate) ----------------------------------------------------------

data(PlethMorph)
fitOLS <- lm.rrpp(TailLength ~ SVL, data = PlethMorph)
fitGLS <- lm.rrpp(TailLength ~ SVL, data = PlethMorph, Cov = PlethMorph$PhyCov)

anova(fitOLS)
anova(fitGLS)

sizeDF <- data.frame(SVL = sort(PlethMorph$SVL))
plot(predict(fitOLS, sizeDF)) # Correlated error
plot(predict(fitGLS, sizeDF)) # Independent error

#' # GLS Example (Multivariate) ----------------------------------------------------------

Y <- as.matrix(cbind(PlethMorph$TailLength,
PlethMorph$HeadLength,
PlethMorph$Snout.eye,
PlethMorph$BodyWidth,
PlethMorph$Forelimb,
PlethMorph$Hindlimb))
PlethMorph <- rrpp.data.frame(PlethMorph, Y=Y)
fitOLSm <- lm.rrpp(Y ~ SVL, data = PlethMorph)
fitGLSm <- lm.rrpp(Y ~ SVL, data = PlethMorph, Cov = PlethMorph$PhyCov)

anova(fitOLSm)
anova(fitGLSm)

plot(predict(fitOLSm, sizeDF), PC= TRUE) # Correlated error
plot(predict(fitGLSm, sizeDF), PC= TRUE) # Independent error



