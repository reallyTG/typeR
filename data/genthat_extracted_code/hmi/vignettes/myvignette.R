## ------------------------------------------------------------------------
## $Plant
## [1] "ordered_categorical"
## 
## $Type
## [1] "binary"
## 
## $Treatment
## [1] "binary"
## 
## $conc
## [1] "roundedcont"
## 
## $uptake
## [1] "cont"

## ----echo = TRUE---------------------------------------------------------
library("lme4")
ex <- sleepstudy
set.seed(1)
ex[sample(1:nrow(CO2), size = 20), "Reaction"] <- NA
head(ex) # e.g. in line 5 there is a NA now.

## ----eval = TRUE, message = TRUE, cache = TRUE---------------------------
library("lme4")
lmer(formula = Reaction~1+Days+(1+Days|Subject), data = ex, na.action = na.omit)

## ----eval = TRUE, echo = FALSE, results = "hide", message = FALSE, cache = TRUE----
library("hmi")
set.seed(1)
result_multi <- hmi(data = ex, model_formula = Reaction ~ 1 + Days + (1 + Days | Subject), maxit = 1, nitt = 1200, burnin = 200)

## ----eval = TRUE, echo = TRUE, message = FALSE, cache = TRUE-------------
result_multi$pooling

