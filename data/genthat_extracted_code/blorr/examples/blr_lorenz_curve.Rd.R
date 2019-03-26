library(blorr)


### Name: blr_lorenz_curve
### Title: Lorenz curve
### Aliases: blr_lorenz_curve

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
family = binomial(link = 'logit'))

blr_lorenz_curve(model)




