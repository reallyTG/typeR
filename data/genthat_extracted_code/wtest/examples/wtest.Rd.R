library(wtest)


### Name: wtest
### Title: W-test
### Aliases: wtest

### ** Examples

data(diabetes.geno)
data(phenotype1)

## Step 1. HF Calculation
# Please note that parameter B is recommended to be greater than 400.
hf1 <- hf(data = diabetes.geno, w.order = 1, B = 100)
hf2 <- hf(data = diabetes.geno, w.order = 2, B = 50)

## Step 2. W-test Calculation
w1 <- wtest(diabetes.geno, phenotype1, w.order = 1, hf1 = hf1)
w2 <- wtest(diabetes.geno, phenotype1, w.order = 2, input.pval = 0.3,
            input.poolsize = 50, output.pval = 0.01, hf1 = hf1, hf2 = hf2)
w.pair <- wtest(diabetes.geno, phenotype1, w.order = 2, which.marker = c(10,13), hf2 = hf2)



