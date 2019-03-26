library(qte)


### Name: MDiD
### Title: Mean Difference in Differences
### Aliases: MDiD

### ** Examples

## load the data
data(lalonde)

## Run the Mean Difference in Differences method conditioning on
## age, education, black, hispanic, married, and nodegree
md1 <- MDiD(re ~ treat, t=1978, tmin1=1975, tname="year",
 xformla=~age + I(age^2) + education + black + hispanic + married + nodegree,
 data=lalonde.psid.panel, idname="id", se=FALSE,
 probs=seq(0.05, 0.95, 0.05))
summary(md1)




