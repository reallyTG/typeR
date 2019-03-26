library(glmmTMB)


### Name: inForm
### Title: test formula: does it contain a particular element?
### Aliases: inForm extractForm dropHead drop.special2
### Keywords: internal

### ** Examples

inForm(z~.,quote(.))
inForm(z~y,quote(.))
inForm(z~a+b+c,quote(c))
inForm(z~a+b+(d+e),quote(c))
f <- ~ a + offset(x)
f2 <- z ~ a
inForm(f,quote(offset))
inForm(f2,quote(offset))
extractForm(~a+offset(b),quote(offset))
extractForm(~c,quote(offset))
extractForm(~a+offset(b)+offset(c),quote(offset))
dropHead(~a+offset(b),quote(offset))
dropHead(~a+poly(x+z,3)+offset(b),quote(offset))



