library(blorr)


### Name: blr_regress
### Title: Binary logistic regression
### Aliases: blr_regress blr_regress.glm

### ** Examples

# using formula
blr_regress(object = honcomp ~ female + read + science, data = hsb2)

# using a model built with glm
model <- glm(honcomp ~ female + read + science, data = hsb2,
             family = binomial(link = 'logit'))

blr_regress(model)

# odds ratio estimates
blr_regress(model, odd_conf_limit = TRUE)




