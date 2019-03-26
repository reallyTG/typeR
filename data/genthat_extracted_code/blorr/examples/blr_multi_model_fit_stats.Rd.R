library(blorr)


### Name: blr_multi_model_fit_stats
### Title: Multi model fit statistics
### Aliases: blr_multi_model_fit_stats blr_multi_model_fit_stats.default

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

model2 <- glm(honcomp ~ female + read + math, data = hsb2,
family = binomial(link = 'logit'))

blr_multi_model_fit_stats(model, model2)




