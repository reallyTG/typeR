library(DAMisc)


### Name: NKnotsTest
### Title: Test of functional form assumption using B-splines
### Aliases: NKnotsTest

### ** Examples

library(car)
NKnotsTest(prestige ~ education + type, var="income", data=na.omit(Prestige), targetdf=3)



