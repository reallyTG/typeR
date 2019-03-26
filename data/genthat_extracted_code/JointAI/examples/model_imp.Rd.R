library(JointAI)


### Name: model_imp
### Title: Joint analysis and imputation of incomplete data
### Aliases: model_imp lm_imp glm_imp lme_imp glme_imp glmer_imp
###   survreg_imp

### ** Examples

# Example 1: Linear regression with incomplete covariates
mod1 <- lm_imp(y~C1 + C2 + M2, data = wideDF, n.iter = 100)


# Example 2: Logistic regression with incomplete covariats
mod2 <- glm_imp(B1 ~ C1 + C2 + M2, data = wideDF,
                family = binomial(link = "logit"), n.iter = 100)


# Example 3: Linear mixed model with incomplete covariates
mod3 <- lme_imp(y ~ C1 + B2 + L1 + time, random = ~ time|id,
                data = longDF, n.iter = 500)





