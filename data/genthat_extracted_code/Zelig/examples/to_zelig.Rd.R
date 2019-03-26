library(Zelig)


### Name: to_zelig
### Title: Coerce a non-Zelig fitted model object to a Zelig class object
### Aliases: to_zelig

### ** Examples

library(dplyr)
lm.out <- lm(Fertility ~ Education, data = swiss)

z.out <- to_zelig(lm.out)

# to_zelig called from within setx
setx(z.out) %>% sim() %>% plot()




