library(vows)


### Name: semipar.mix.mp
### Title: Massively parallel semiparametric mixed models
### Aliases: semipar.mix.mp

### ** Examples

Y = matrix(rnorm(3000),,3)
x1 = rnorm(1000)
x2 = matrix(rnorm(2000),,2)
family.fac <- factor(rep(1:20,rep(50,20)))
person.fac <- factor(rep(rep(1:25,rep(2,25)),rep(20,50)))
semimix = semipar.mix.mp(Y = Y, x = x1, param = x2, random = ~ (1|a/b), 
          data.ran = data.frame(a = family.fac, b = person.fac))



