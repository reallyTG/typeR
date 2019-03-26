library(blorr)


### Name: blr_pairs
### Title: Concordant & discordant pairs
### Aliases: blr_pairs

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_pairs(model)




