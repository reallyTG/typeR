library(tracheideR)


### Name: ringPlot
### Title: Plot intra-ring variation of tracheid features (with the
###   possibility of plotting a climatic variable)
### Aliases: ringPlot

### ** Examples


## Not run:

# year 2010
y2010raw <- getTrac(tch$y2010, scale = .169)
y2010std <- tracheider(y2010raw)
par(oma = c(2,1,1,0.5))
par(mar = c(2,4,1,4))
y2010LD <- ringPlot(traq = y2010std, varMean = colMeans(sw),
varYear = sw["2010",], main=2010,type = "LD",  ylim = c(0,45),
ylab = expression(paste("LD (", mu,"m)")),varName = "Soil moisture")

# year 2013
y2013raw <- getTrac(tch$y2013, scale = .169)
y2013std <- tracheider(y2013raw)
y2013LD <- ringPlot(traq = y2013std, varMean = colMeans(sw),
varYear = sw["2013",], main=2013,type = "LD",  ylim = c(0,45),
ylab = expression(paste("LD (", mu,"m)")),varName = "Soil moisture")

# 2010 & 2013 in the same plot
par(mfcol = c(2,1))
par(oma = c(2,1,1,0.5))
par(mar = c(2,4,1,4))

ringPlot(y2010std,  varMean = colMeans(sw), varYear = sw["2010",],
type = "LD", ylab = "", main=2010, addGS = FALSE, addMonths = FALSE)

ringPlot(y2013std,  varMean = colMeans(sw), varYear = sw["2013",],
type = "LD", ylab=expression(paste("LD (", mu,"m)")),
main = 2013, addGS = TRUE, varName= "Soil moisture")

## End(not run)



