library(sitar)


### Name: sitar
### Title: Fit SITAR growth curve model
### Aliases: sitar update.sitar update.sitar
### Keywords: models nonlinear package regression

### ** Examples


data(heights)
##  fit simple model
(m1 <- sitar(x=age, y=height, id=id, data=heights, df=5))

##  relate random effects to age at menarche (with censored values +ve)
##  both a (size) and b (tempo) are positively associated with age at menarche
amen <- abs(heights$men)
(m2 <- update(m1, a.form=~amen, b.form=~amen, c.form=~amen))



