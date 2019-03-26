library(simstudy)


### Name: genCorFlex
### Title: Create multivariate (correlated) data - for general
###   distributions
### Aliases: genCorFlex

### ** Examples

def <- defData(varname = "xNorm", formula = 0, variance = 4, dist = "normal")
def <- defData(def, varname = "xGamma1", formula = 15, variance = 2, dist = "gamma")
def <- defData(def, varname = "xBin", formula = 0.5, dist = "binary")
def <- defData(def, varname = "xUnif1", formula = "0;10", dist = "uniform")
def <- defData(def, varname = "xPois", formula = 15, dist = "poisson")
def <- defData(def, varname = "xUnif2", formula = "23;28", dist = "uniform")
def <- defData(def, varname = "xUnif3", formula = "100;150", dist = "uniform")
def <- defData(def, varname = "xGamma2", formula = 150, variance = 0.003, dist = "gamma")

dt <- genCorFlex(1000, def, tau = 0.3 , corstr = "cs")

cor(dt[,-"id"])
cor(dt[,-"id"], method = "kendall")
var(dt[,-"id"])
apply(dt[,-"id"], 2, mean)




