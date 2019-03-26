library(qte)


### Name: CiC
### Title: Change in Changes
### Aliases: CiC

### ** Examples

## load the data
data(lalonde)
## Run the Change in Changes model conditioning on age, education,
## black, hispanic, married, and nodegree
c1 <- CiC(re ~ treat, t=1978, tmin1=1975, tname="year",
 xformla=~age + I(age^2) + education + black + hispanic + married + nodegree,
 data=lalonde.psid.panel, idname="id", se=FALSE,
 probs=seq(0.05, 0.95, 0.05))
summary(c1)





