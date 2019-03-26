library(wtest)


### Name: w.qqplot
### Title: W P-values Diagnosis by Q-Q Plot
### Aliases: w.qqplot

### ** Examples

data(diabetes.geno)
data(phenotype1)
## Step 1. HF Calculation
# Please note that parameter B is recommended to be greater than 400.
hf1<-hf(data = diabetes.geno, w.order = 1, B = 200)

## Step 2. Q-Q Plot
w.qqplot(data = diabetes.geno, y = phenotype1, w.order = 1, hf1 = hf1, cex =.5)
abline(0,1)



