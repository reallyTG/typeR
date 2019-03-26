library(PMCMRplus)


### Name: mandelhTest
### Title: Mandel's h Test According to E 691 ASTM
### Aliases: mandelhTest mandelhTest.default mandelhTest.formula
### Keywords: htest

### ** Examples

data(Pentosan)
mandelhTest(value ~ lab, data=Pentosan, subset=(material == "A"))



