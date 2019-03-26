library(blorr)


### Name: blr_gini_index
### Title: Gini index
### Aliases: blr_gini_index

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_gini_index(model)




