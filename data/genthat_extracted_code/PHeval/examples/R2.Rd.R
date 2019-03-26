library(PHeval)


### Name: R2
### Title: R2 coefficient
### Aliases: R2

### ** Examples

library(survival)
data(ovarian)
R2(futime+fustat~age,data=ovarian)
R2(futime+fustat~age+rx,data=ovarian)



