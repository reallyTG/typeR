library(tailDepFun)


### Name: dataKNMI
### Title: Wind speeds in the Netherlands.
### Aliases: dataKNMI

### ** Examples

data(dataKNMI)
n <- nrow(dataKNMI$data)
locations <- dataKNMI$loc
x <- apply(dataKNMI$data, 2, function(i) n/(n + 0.5 - rank(i)))
indices <- selectGrid(cst = c(0,1), d = 22, locations = locations, maxDistance = 0.5)
EstimationBR(x, locations, indices, k = 60, method = "Mestimator", isotropic = TRUE,
covMat = FALSE)$theta



