library(blorr)


### Name: blr_rsq_adj_count
### Title: Adjusted count R2
### Aliases: blr_rsq_adj_count

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
            family = binomial(link = 'logit'))

blr_rsq_adj_count(model)




