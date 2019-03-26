library(blorr)


### Name: blr_model_fit_stats
### Title: Model fit statistics
### Aliases: blr_model_fit_stats

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
            family = binomial(link = 'logit'))

blr_model_fit_stats(model)




