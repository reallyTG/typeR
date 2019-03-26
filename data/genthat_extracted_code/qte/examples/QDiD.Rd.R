library(qte)


### Name: QDiD
### Title: Quantile Difference in Differences
### Aliases: QDiD

### ** Examples

## load the data
data(lalonde)

## Run the Quantile Difference in Differences method conditioning on
## age, education, black, hispanic, married, and nodegree
qd1 <- QDiD(re ~ treat, t=1978, tmin1=1975, tname="year",
 xformla=~age + I(age^2) + education + black + hispanic + married + nodegree,
 data=lalonde.psid.panel, idname="id", se=FALSE,
 probs=seq(0.05, 0.95, 0.05))
summary(qd1)




