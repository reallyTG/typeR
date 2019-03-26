## ---- echo=T-------------------------------------------------------------
library(MullerPlot)

## ---- echo=T-------------------------------------------------------------
data("Attributes")
Attributes

## ---- echo=T-------------------------------------------------------------
data("PopulationDataList")
PopulationDataList[1:10,]

## ---- echo=T-------------------------------------------------------------
data("PopulationDataTable")
PopulationDataTable[,1:14]

## ---- echo=T, fig.width=7.5,fig.height=3,fig.align='center'--------------
data(PopulationDataList)
data(Attributes)
layout(matrix(c(1,2), nrow = 1), widths = c(0.8, 0.2))
par(mar=c(3, 3, 1, 0))
m.plot <- Muller.plot(attributes = Attributes, population.data = PopulationDataList,
                      data.method = "list", time.interval.method = "equal",mgp=c(2,0.5,0))
plot(0,0,axes = F)
par(mar=c(0, 0, 0, 0))
legend("right", legend = m.plot$name,col = as.character(m.plot$color),pch = 19)

## ---- echo=T, fig.width=7.5,fig.height=3,fig.align='center'--------------
Attributes <- Attributes[c(1,3,2,4,7,5,6,8),]
layout(matrix(c(1,2), nrow = 1), widths = c(0.8, 0.2))
par(mar=c(3, 3, 1, 0))
m.plot <- Muller.plot(attributes = Attributes, population.data = PopulationDataList,
                      data.method = "list", time.interval.method = "equal",mgp=c(2,0.5,0))
plot(0,0,axes = F)
par(mar=c(0, 0, 0, 0))
legend("right", legend = m.plot$name,col = as.character(m.plot$color),pch = 19)

## ---- echo=T, fig.width=7.5,fig.height=3,fig.align='center'--------------
data(PopulationDataTable)
par(mar=c(3, 3, 1, 1))
Attributes[,3] <- rainbow(8)
m.plot <- Muller.plot(attributes = Attributes, population.data = PopulationDataTable,
                      data.method = "table", time.interval.method = "equal",mgp=c(2,0.5,0))

## ---- echo=T, fig.width=7.5,fig.height=3,fig.align='center'--------------
colnames(PopulationDataTable) <- c(seq(0,1000,50),seq(1050,3000,100),seq(3500,33000,500))
par(mar=c(3, 3, 1, 1))
Attributes[,3] <- rainbow(8)
m.plot <- Muller.plot(attributes = Attributes, population.data = PopulationDataTable,
                      data.method = "table", time.interval.method = "linear",mgp=c(2,0.5,0))

## ------------------------------------------------------------------------
citation(package = "MullerPlot")

