library(afmToolkit)


### Name: afmExpDecay
### Title: Exponential decay fit
### Aliases: afmExpDecay

### ** Examples

data <- afmReadJPK("force-save-JPK-3h.txt.gz", path = path.package("afmToolkit"))
width <- 20
mul1 <- 1
mul2 <- 10
data <- afmContactPoint(data, width = width, mul1 = mul1, mul2 = mul2)
data <- afmDetachPoint(data, width = width, mul1 = mul1, mul2 = mul2)
data <- afmBaselineCorrection(data)
data <- afmExpDecay(data, nexp = 2, type = "CH")



