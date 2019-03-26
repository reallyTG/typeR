library(semTools)


### Name: probe2WayRC
### Title: Probing two-way interaction on the residual-centered latent
###   interaction
### Aliases: probe2WayRC

### ** Examples


library(lavaan)

dat2wayRC <- orthogonalize(dat2way, 1:3, 4:6)

model1 <- "
f1 =~ x1 + x2 + x3
f2 =~ x4 + x5 + x6
f12 =~ x1.x4 + x2.x5 + x3.x6
f3 =~ x7 + x8 + x9
f3 ~ f1 + f2 + f12
f12 ~~0*f1
f12 ~~ 0*f2
x1 ~ 0*1
x4 ~ 0*1
x1.x4 ~ 0*1
x7 ~ 0*1
f1 ~ NA*1
f2 ~ NA*1
f12 ~ NA*1
f3 ~ NA*1
"

fitRC2way <- sem(model1, data = dat2wayRC, std.lv = FALSE,
                 meanstructure = TRUE)
summary(fitRC2way)

result2wayRC <- probe2WayRC(fitRC2way, c("f1", "f2", "f12"),
                            "f3", "f2", c(-1, 0, 1))
result2wayRC




