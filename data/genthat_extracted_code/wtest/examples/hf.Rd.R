library(wtest)


### Name: hf
### Title: Patameter Estimation for W-test Probability Distribution
### Aliases: hf

### ** Examples

data(diabetes.geno)

# Please note that parameter B is recommended to be greater than 400.
# For high order interaction analysis (w.order > 2), it is recommended to use default n.sample.
hf1 <- hf(data = diabetes.geno, w.order = 1, B = 100)
hf2 <- hf(data = diabetes.geno, w.order = 2, B = 80)



