library(numform)


### Name: f_pval
### Title: Format P-Values
### Aliases: f_pval ff_pval

### ** Examples

f_pval(.05)
f_pval(.04999999999999999)
f_pval(.0002)
f_pval(.0002, .001)

mod1 <- t.test(1:10, y = c(7:20))
f_pval(mod1$p.value)

mod2 <- t.test(1:10, y = c(7:20, 200))
f_pval(mod2$p.value)



