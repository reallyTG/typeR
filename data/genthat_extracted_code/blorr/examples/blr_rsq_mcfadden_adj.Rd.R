library(blorr)


### Name: blr_rsq_mcfadden_adj
### Title: McFadden's adjusted R2
### Aliases: blr_rsq_mcfadden_adj

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
            family = binomial(link = 'logit'))

blr_rsq_mcfadden_adj(model)




