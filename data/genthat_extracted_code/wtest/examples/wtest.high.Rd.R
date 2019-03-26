library(wtest)


### Name: wtest.high
### Title: W-test for High Order Interaction Analysis
### Aliases: wtest.high

### ** Examples

data(diabetes.geno)
data(phenotype1)

## Step 1. HF Calculation
# Please note that parameter B is recommended to be greater than 400 for w.order = 1 or 2.
# For high order interaction analysis (w.order > 2), it is recommended to use default n.sample.
hf1 <- hf(data = diabetes.geno, w.order = 1, B = 100)
hf.high <- hf(data = diabetes.geno, w.order = 3, B = 30, n.marker = 10)

## Step 2. W-test Calculation
w1 <- wtest.high(diabetes.geno, phenotype1, w.order = 1, hf1 = hf1)
w3 <- wtest.high(diabetes.geno, phenotype1, w.order = 3, input.pval = 0.3,
            input.poolsize = 50, output.pval = 0.5, hf1 = hf1, hf.high.order = hf.high)
w.set <- wtest.high(diabetes.geno, phenotype1, w.order = 3, which.marker = c(10,13,20),
            hf.high.order = hf.high)



