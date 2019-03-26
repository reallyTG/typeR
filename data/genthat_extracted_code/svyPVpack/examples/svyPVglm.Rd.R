library(svyPVpack)


### Name: svyPVglm
### Title: Survey-weighted generalised linear models with uasge of
###   palusible values.
### Aliases: svyPVglm summary.svyPVglm
### Keywords: glm

### ** Examples

data(svy_example1)

res_glm <- svyPVglm(plaus.. ~ otherPlaus.. + age, svy.exrep, placeholder = 1:3)

res_glm




