library(blorr)


### Name: blr_rsq_count
### Title: Count R2
### Aliases: blr_rsq_count

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
            family = binomial(link = 'logit'))

blr_rsq_count(model)




