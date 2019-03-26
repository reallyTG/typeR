library(blorr)


### Name: blr_prep_lorenz_data
### Title: Lorenz curve data
### Aliases: blr_prep_lorenz_data

### ** Examples

model <- glm(honcomp ~ female + read + science, data = hsb2,
             family = binomial(link = 'logit'))
data <- model$data
blr_prep_lorenz_data(model, data, FALSE)




