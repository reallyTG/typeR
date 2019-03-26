library(afmToolkit)


### Name: afmIndentation
### Title: afmIndentation
### Aliases: afmIndentation

### ** Examples

data <- afmReadJPK("force-save-JPK-3h.txt.gz", path = path.package("afmToolkit"))
data <- afmContactPoint(data, width = 20, mul1 = 1, mul2 = 20)
data <- afmDetachPoint(data, width = 40, mul1 = 3, mul2 = 40)
data <- afmBaselineCorrection(data)
data <- afmZeroPointSlope(data, segment = "approach")
data <- afmIndentation(data)
head(data$data)



