library(blorr)


### Name: blr_test_lr
### Title: Likelihood ratio test
### Aliases: blr_test_lr blr_test_lr.default

### ** Examples

# compare full model with intercept only model
# full model
model_1 <- glm(honcomp ~ female + read + science, data = hsb2,
            family = binomial(link = 'logit'))

blr_test_lr(model_1)

# compare full model with nested model
# nested model
model_2 <- glm(honcomp ~ female + read, data = hsb2,
            family = binomial(link = 'logit'))

blr_test_lr(model_1, model_2)




