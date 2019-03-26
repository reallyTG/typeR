library(broom)


### Name: tidy.speedlm
### Title: Tidy a(n) speedlm object
### Aliases: tidy.speedlm speedlm_tidiers speedglm_tidiers

### ** Examples


mod <- speedglm::speedlm(mpg ~ wt + qsec, data = mtcars)

tidy(mod)
glance(mod)
augment(mod)




