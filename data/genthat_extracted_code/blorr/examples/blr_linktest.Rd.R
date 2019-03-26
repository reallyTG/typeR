library(blorr)


### Name: blr_linktest
### Title: Model specification error
### Aliases: blr_linktest

### ** Examples


model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_linktest(model)




