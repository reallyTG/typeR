library(blorr)


### Name: blr_rsq_nagelkerke
### Title: Cragg-Uhler (Nagelkerke) R2
### Aliases: blr_rsq_nagelkerke

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
            family = binomial(link = 'logit'))

blr_rsq_nagelkerke(model)




