library(qte)


### Name: panel.qtet
### Title: panel.qtet
### Aliases: panel.qtet

### ** Examples

##load the data
data(lalonde)

## Run the panel.qtet method on the experimental data with no covariates
pq1 <- panel.qtet(re ~ treat, t=1978, tmin1=1975, tmin2=1974, tname="year",
 x=NULL, data=lalonde.exp.panel, idname="id", se=FALSE,
 probs=seq(0.05, 0.95, 0.05))
summary(pq1)

## Run the panel.qtet method on the observational data with no covariates
pq2 <- panel.qtet(re ~ treat, t=1978, tmin1=1975, tmin2=1974, tname="year",
 x=NULL, data=lalonde.psid.panel, idname="id", se=FALSE,
 probs=seq(0.05, 0.95, 0.05))
summary(pq2)

## Run the panel.qtet method on the observational data conditioning on
## age, education, black, hispanic, married, and nodegree.
## The propensity score will be estimated using the default logit method.
pq3 <- panel.qtet(re ~ treat, t=1978, tmin1=1975, tmin2=1974, tname="year",
 xformla=~age + I(age^2) + education + black + hispanic + married + nodegree,
 data=lalonde.psid.panel, idname="id", se=FALSE,
 probs=seq(0.05, 0.95, 0.05))
summary(pq3)





