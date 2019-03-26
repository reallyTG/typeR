library(afmToolkit)


### Name: afmYoungModulus
### Title: afmYoungModulus
### Aliases: afmYoungModulus

### ** Examples

data <- afmReadJPK("force-save-JPK-2h.txt.gz", path = path.package("afmToolkit"))
data <- afmContactPoint(data, width = 20, mul1 = 1, mul2 = 20)
data <- afmDetachPoint(data, width = 40, mul1 = 3, mul2 = 40)
data <- afmBaselineCorrection(data)
data <- afmZeroPointSlope(data, segment = "approach")
data <- afmIndentation(data)
data <- afmYoungModulus(data, thickness = 1e-8, params = list(alpha = 22),
                        silent = TRUE)
print(data$YoungModulus$YoungModulus)



