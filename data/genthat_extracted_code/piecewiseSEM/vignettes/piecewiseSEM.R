## ------------------------------------------------------------------------
dat <- data.frame(x1 = runif(50), y1 = runif(50), y2 = runif(50), y3 = runif(50))

## ---- error = T----------------------------------------------------------
# Load required libraries
library(piecewiseSEM)

model <- psem(lm(y1 ~ x1, dat), lm(y1 ~ y2, dat), lm(y2 ~ x1, dat), lm(y3 ~ y1, dat))

## ------------------------------------------------------------------------
model <- psem(lm(y1 ~ x1 + y2, dat), lm(y2 ~ x1, dat), lm(y3 ~ y1, dat))

## ------------------------------------------------------------------------
summary(model, .progressBar = F)

## ------------------------------------------------------------------------
# Create fake data.frame
coefs.data <- data.frame(
  y = runif(100),
  x1 = runif(100),
  x2 = runif(100)
)

# Evaluate linear model
model <- lm(y ~ x1, coefs.data)

## ------------------------------------------------------------------------
coefs(model, standardize = "none")

# These coefficients are identical to those returned by summmary
summary(model)$coefficients

## ------------------------------------------------------------------------
coefs(model, standardize = "none", intercepts = TRUE)

## ------------------------------------------------------------------------
# Obtain the raw coefficient from the coefficient table
B <- summary(model)$coefficients[2, 1]

# Compute the standard deviation of the independent variable
sd.x <- sd(coefs.data$x1)

# Compute the standard deviation of the dependent variable
sd.y <- sd(coefs.data$y)

# Scale Beta
B.sdscaled <- B * sd.x/sd.y


## ------------------------------------------------------------------------
coefs(model, standardize = "scale")

# Compare to hand-calculated value
B.sdscaled

## ------------------------------------------------------------------------
# Calculate range for the independent variable
range.x <- diff(range(coefs.data$x1))

# Calculate range for the independent variable
range.y <- diff(range(coefs.data$y))

# Scale Beta
B.range <- B * range.x/range.y


## ------------------------------------------------------------------------
coefs(model, standardize = "range")

# Compare to hand-calculated value
B.range

## ------------------------------------------------------------------------
# Consider the range 0.1 - 0.8 for x
relrange.x <- 0.8-0.1

# Consider the range 0.3-0.6 for y
relrange.y <- 0.6-0.3

# Scale Beta
B.relrange <- B * relrange.x/relrange.y

# Compare to automated calculation
coefs(model, standardize = list(x1 = c(0.1, 0.8), y = c(0.3, 0.6)))

B.relrange

## ---- warning = FALSE, message = FALSE-----------------------------------
# Create fake binomial response
coefs.data$y.binom <- rbinom(100, 1, 0.5)

# Fit using GLM
glm.model <- glm(y ~ x1, "binomial", coefs.data)

# Extract linear beta
Beta.glm <- summary(glm.model)$coefficients[2, 1]

## ------------------------------------------------------------------------
# Extract predicted values on the link scale
preds <- predict(glm.model, type = "link")

# Compute sd of error variance using theoretical variances
sd.y.LT <- sqrt(var(preds) + pi^2/3)

# Compute sd of x
sd.x <- sd(coefs.data$x1)

# Compare to automated output
coefs(glm.model, standardize.type = "latent.linear")

Beta.glm * sd.x / sd.y.LT


## ---- messages = F-------------------------------------------------------
# Generate fake data
glmdat <- data.frame(x1 = runif(50), y1 = rpois(50, 10), y2 = rpois(50, 50), y3 = runif(50))

# Extract P-values
summary(lm(y1 ~ y2 + x1, glmdat))$coefficients[2, 4]

summary(lm(y2 ~ y1 + x1, glmdat))$coefficients[2, 4]

# Repeat but model y1 and y2 and Poisson-distributed
summary(glm(y1 ~ y2 + x1, "poisson", glmdat))$coefficients[2, 4]

summary(glm(y2 ~ y1 + x1, "poisson", glmdat))$coefficients[2, 4]

## ---- error = T----------------------------------------------------------
# Generate fake data
glmdat <- data.frame(x1 = runif(50), y1 = rpois(50, 10), y2 = rpois(50, 50), y3 = runif(50))

# Construct SEM
glmsem <- psem(
  glm(y1 ~ x1, "poisson", glmdat),
  glm(y2 ~ x1, "poisson", glmdat),
  lm(y3 ~ y1 + y2, glmdat)
)

summary(glmsem)

## ------------------------------------------------------------------------
summary(glmsem, direction = c("y1 <- y2"), .progressBar = F)$dTable

## ------------------------------------------------------------------------
summary(update(glmsem, y1 %~~% y2), .progressBar = F)

## ------------------------------------------------------------------------
summary(glmsem, conserve = T, .progressBar = F)$dTable

## ------------------------------------------------------------------------
cordat <- data.frame(x1 = runif(50), y1 = runif(50), y2 = runif(50), y3 = runif(50))

corsem <- psem(
  lm(y1 ~ x1, cordat),
  lm(y2 ~ x1, cordat),
  y1 %~~% y2, 
  lm(y3 ~ y1 + y2, cordat)
)

summary(corsem, .progressBar = F)

## ------------------------------------------------------------------------
cor(resid(lm(y1 ~ x1, cordat)), resid(lm(y2 ~ x1, cordat)))

cerror(y1 %~~% y2, corsem)

## ---- message = F, results = 'hide'--------------------------------------
AICdat <- data.frame(x1 = runif(50), y1 = runif(50), y2 = runif(50), y3 = runif(50))

sem1 <- psem(
  lm(y1 ~ x1, AICdat),
  lm(y2 ~ y1, AICdat),
  lm(y3 ~ y2, AICdat)
)

sem2 <- psem(
  lm(y1 ~ x1, AICdat),
  lm(y2 ~ y1, AICdat)
)

AIC(sem1, sem2)

## ------------------------------------------------------------------------
sem2new <- update(sem2, y3 ~ 1)

AIC(sem1, sem2new)

## ---- message = F, results = "hide"--------------------------------------
# Load required packages
library(nlme)
library(lme4)

# Load Shipley data
data(shipley)

# Create list of structural equations
shipley.list <- list(

  lme(DD ~ lat, random = ~ 1 | site / tree, na.action = na.omit, 
  data = shipley),
  
  lme(Date ~ DD, random = ~ 1 | site / tree, na.action = na.omit, 
  data = shipley),
  
  lme(Growth ~ Date, random = ~ 1 | site / tree, na.action = na.omit, 
  data = shipley),
  
  glmer(Live ~ Growth + (1 | site) + (1 | tree), 
  family = binomial(link = "logit"), data = shipley) 
  
  )

## ------------------------------------------------------------------------
(old.fit <- sem.fit(shipley.list, shipley, .progressBar = F))

(old.coefs <- sem.coefs(shipley.list))

## ---- messages = FALSE---------------------------------------------------
shipley.psem <- as.psem(shipley.list)
### NOT RUN
# shipley.psem <- psem(
# 
#   lme(DD ~ lat, random = ~ 1 | site / tree, na.action = na.omit, 
#   data = shipley),
#   
#   lme(Date ~ DD, random = ~ 1 | site / tree, na.action = na.omit, 
#   data = shipley),
#   
#   lme(Growth ~ Date, random = ~ 1 | site / tree, na.action = na.omit, 
#   data = shipley),
#   
#   glmer(Live ~ Growth + (1 | site) + (1 | tree), 
#   family = binomial(link = "logit"), data = shipley) 
#   
#   )

## ------------------------------------------------------------------------
(new.summary <- summary(shipley.psem, .progressBar = F))

## ---- messages = FALSE---------------------------------------------------
# Old function
sem.aic(shipley.list, shipley, .progressBar = F)$AIC
# Extract from new summary object
new.summary$IC$AIC
### NOT RUN
# Alternately, one could call AIC() on the `psem` object
# AIC(shipley.psem)

## ---- messages = FALSE---------------------------------------------------
# Old function
sem.missing.paths(shipley.list, shipley, .progressBar = F)
# Extract from new summary object
new.summary$dTable
### NOT RUN
# Alternately, one could call dSep() on the `psem` object
# dSep(shipley.psem)

## ---- messages = FALSE---------------------------------------------------
# Old function
sem.fit(shipley.list, shipley, .progressBar = F)$Fisher.C
# Extract from summary object
new.summary$Cstat

## ---- messages = FALSE---------------------------------------------------
# Old function
sem.coefs(shipley.list, shipley)

sem.coefs(shipley.list, shipley, standardize = "scale")
# Extract from new summary object
new.summary$coefficients
# The new coefs() function is much faster too
coefs(shipley.psem)

