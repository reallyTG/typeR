library(qte)


### Name: spatt
### Title: spatt
### Aliases: spatt

### ** Examples

##load the data
data(lalonde)

## Run the panel.qtet method on the experimental data with no covariates
att1 <- spatt(re ~ treat, t=1978, tmin1=1975, tname="year",
 x=NULL, data=lalonde.psid.panel, idname="id", se=FALSE)
summary(att1)

## Run the panel.qtet method on the observational data with no covariates





