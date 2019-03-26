library(wtest)


### Name: w.diagnosis
### Title: W-test Probability Distribution Diagnostic Plot
### Aliases: w.diagnosis

### ** Examples

data(diabetes.geno)
# Please note that parameter B is recommended to be greater than 400.
hf1 <- hf(data = diabetes.geno, w.order = 1, B = 100)
hf2 <- hf(data = diabetes.geno, w.order = 2, B = 50)
w.diagnosis(diabetes.geno, w.order = 1, n.rep = 100, hf1 = hf1, main=NULL, xlab=NULL, ylab=NULL)
w.diagnosis(diabetes.geno, w.order = 2, n.rep = 100, hf2 = hf2, main=NULL, xlab=NULL, ylab=NULL)



