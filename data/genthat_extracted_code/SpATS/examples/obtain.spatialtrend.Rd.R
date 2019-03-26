library(SpATS)


### Name: obtain.spatialtrend
### Title: Predictions of the spatial trend from an 'SpATS' object
### Aliases: obtain.spatialtrend

### ** Examples

library(SpATS)
data(wheatdata)
wheatdata$R <- as.factor(wheatdata$row)
wheatdata$C <- as.factor(wheatdata$col)

m0 <- SpATS(response = "yield", spatial = ~ SAP(col, row, nseg = c(10,20)), 
 genotype = "geno", fixed = ~ colcode + rowcode, random = ~ R + C, 
 data = wheatdata, control =  list(tolerance = 1e-03))

spat.trend.1 <- obtain.spatialtrend(m0)
spat.trend.2 <- obtain.spatialtrend(m0, grid = c(10, 10))

colors = topo.colors(100)
op <- par(mfrow = c(1,2))
fields::image.plot(spat.trend.1$col.p, spat.trend.1$row.p, t(spat.trend.1$fit), 
 main = "Prediction on a grid of 100 x 100", col = colors, xlab = "Columns", ylab = "Rows")
fields::image.plot(spat.trend.2$col.p, spat.trend.2$row.p, t(spat.trend.2$fit), 
 main = "Prediction on a grid of 10 x 10", col = colors, xlab = "Columns", ylab = "Rows")
par(op)



