library(TempleMetrics)


### Name: Fycondx.DR
### Title: Fycondx.DR
### Aliases: Fycondx.DR

### ** Examples

data(igm)
yvals <- seq(quantile(igm$lcfincome,.05,type=1),
 quantile(igm$lcfincome,.95, type=1), length.out=100)
dres <- distreg(lcfincome ~ lfincome + HEDUC, igm, yvals)
xdf <- data.frame(lfincome=10, HEDUC=c("LessHS","HS"))
d <- Fycondx(dres, yvals, xdf)
d
y0 <- yvals[50]
d[[1]](y0)




