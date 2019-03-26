library(blorr)


### Name: blr_rsq_mcfadden
### Title: McFadden's R2
### Aliases: blr_rsq_mcfadden

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
            family = binomial(link = 'logit'))

blr_rsq_mcfadden(model)




