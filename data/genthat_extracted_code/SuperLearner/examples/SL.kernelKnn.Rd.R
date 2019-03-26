library(SuperLearner)


### Name: SL.kernelKnn
### Title: SL wrapper for KernelKNN
### Aliases: SL.kernelKnn

### ** Examples


# Load a test dataset.
data(PimaIndiansDiabetes2, package = "mlbench")

data = PimaIndiansDiabetes2

# Omit observations with missing data.
data = na.omit(data)

Y_bin = as.numeric(data$diabetes)
X = subset(data, select = -diabetes)

set.seed(1)

sl = SuperLearner(Y_bin, X, family = binomial(),
                 SL.library = c("SL.mean", "SL.kernelKnn"))
sl




