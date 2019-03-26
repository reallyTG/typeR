library(pubh)


### Name: glm_coef
### Title: Table of coefficients from generalised linear models.
### Aliases: glm_coef

### ** Examples

## Continuous outcome.
data(birthwt, package = "MASS")
birthwt$smoke <- factor(birthwt$smoke, labels=c("Non-smoker", "Smoker"))
birthwt$race <- factor(birthwt$race > 1, labels=c("White", "Non-white"))
model_norm <- glm(bwt ~ smoke + race, data = birthwt)
glm_coef(model_norm)
glm_coef(model_norm, labels=c("Constant", "Smoker vs Non-smoker", "Non-white vs White"))

## Logistic regression.
data(diet, package = "Epi")
model_binom <- glm(chd ~ fibre, data = diet, family = binomial)
glm_coef(model_binom, labels = c("Constant", "Fibre intake (g/day)"))
glm_coef(model_binom, labels = c("Constant", "Fibre intake (g/day)"), type = "ext")

## Poisson regression.
library(MASS)
data(quine)
levels(quine$Eth) <- list(White = "N", Aboriginal = "A")
levels(quine$Sex) <- list(Male = "M", Female = "F")
model_pois <- glm(Days ~ Eth + Sex + Age, family = poisson, data = quine)
glm_coef(model_pois)
deviance(model_pois) / df.residual(model_pois) # to check for overdispersion

model_negbin <- glm.nb(Days ~ Eth + Sex + Age, data = quine)
unadj <- glm_coef(model_negbin, labels=c("Constant",
                                   "Race: Aboriginal/White",
                                   "Sex: Female/Male",
                                   "F1/Primary",
                                   "F2/Primary",
                                   "F3/Primary"))
unadj # Not-adjusted for multiple comparisons

## For more examples, please read the Vignette on Regression.



