library(blorr)


### Name: blr_rsq_mckelvey_zavoina
### Title: McKelvey Zavoina R2
### Aliases: blr_rsq_mckelvey_zavoina

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
            family = binomial(link = 'logit'))

blr_rsq_mckelvey_zavoina(model)




