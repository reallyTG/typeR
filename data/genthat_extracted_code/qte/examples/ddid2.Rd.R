library(qte)


### Name: ddid2
### Title: ddid2
### Aliases: ddid2

### ** Examples

##load the data
data(lalonde)

## Run the panel.qtet method on the experimental data with no covariates
pq1 <- ddid2(re ~ treat, t=1978, tmin1=1975, tname="year",
 x=NULL, data=lalonde.psid.panel, idname="id", se=FALSE,
 probs=seq(0.05, 0.95, 0.05))
summary(pq1)

## Run the panel.qtet method on the observational data with no covariates





