library(MCPAN)


### Name: poly3test
### Title: Approximate simultaneous test for poly-3-adjusted tumour rates
### Aliases: poly3test
### Keywords: htest

### ** Examples


# poly-3-adjusted tumour rates with a potential
# down-turn effect for the highest dose group "4":

data(methyl)

# many-to-one:
methylD<-poly3test(time=methyl$death, status=methyl$tumour,
 f=methyl$group, type = "Dunnett", method = "ADD1")

methylD

# Williams-Contrast:
methylW<-poly3test(time=methyl$death, status=methyl$tumour,
 f=methyl$group, type = "Williams", method = "ADD1", alternative="greater" )

methylW

# Changepoint-Contrast:
methylCh<-poly3test(time=methyl$death, status=methyl$tumour,
 f=methyl$group, type = "Change", method = "ADD1", alternative="greater" )

methylCh




