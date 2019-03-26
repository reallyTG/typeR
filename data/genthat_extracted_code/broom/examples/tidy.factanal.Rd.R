library(broom)


### Name: tidy.factanal
### Title: Tidy a(n) factanal object
### Aliases: tidy.factanal factanal_tidiers

### ** Examples


mod <- factanal(mtcars, 3, scores = "regression")

glance(mod)
tidy(mod)
augment(mod)
augment(mod, mtcars)




