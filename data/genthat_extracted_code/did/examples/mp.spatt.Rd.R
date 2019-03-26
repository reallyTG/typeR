library(did)


### Name: mp.spatt
### Title: mp.spatt
### Aliases: mp.spatt

### ** Examples

data(mpdta)

## with covariates
out1 <- mp.spatt(lemp ~ treat, xformla=~lpop, data=mpdta,
                panel=TRUE, first.treat.name="first.treat",
                idname="countyreal", tname="year",
                bstrap=FALSE, se=TRUE, cband=FALSE)
## summarize the group-time average treatment effects
summary(out1)
## summarize the aggregated treatment effect parameters
summary(out1$aggte)

## without any covariates
out2 <- mp.spatt(lemp ~ treat, xformla=NULL, data=mpdta,
                panel=TRUE, first.treat.name="first.treat",
                idname="countyreal", tname="year",
                bstrap=FALSE, se=TRUE, cband=FALSE)
summary(out2)




