library(blorr)


### Name: blr_rsq_effron
### Title: Effron R2
### Aliases: blr_rsq_effron

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
            family = binomial(link = 'logit'))

blr_rsq_effron(model)




