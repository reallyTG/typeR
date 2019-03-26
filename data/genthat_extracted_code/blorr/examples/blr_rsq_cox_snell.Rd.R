library(blorr)


### Name: blr_rsq_cox_snell
### Title: Cox Snell R2
### Aliases: blr_rsq_cox_snell

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
            family = binomial(link = 'logit'))

blr_rsq_cox_snell(model)




