library(PMCMRplus)


### Name: mandelkTest
### Title: Mandel's k Test According to E 691 ASTM
### Aliases: mandelkTest mandelkTest.default mandelkTest.formula
### Keywords: htest

### ** Examples

data(Pentosan)
mandelkTest(value ~ lab, data=Pentosan, subset=(material == "A"))



