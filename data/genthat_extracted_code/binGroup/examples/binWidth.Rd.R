library(binGroup)


### Name: binWidth
### Title: Expected Confidence Interval Width for One Binomial Proportion
### Aliases: binWidth
### Keywords: htest

### ** Examples



# methods differ slightly in length when sample sizes are large:

binWidth(n=200,p=0.02,alternative="two.sided",
 method="CP")$expCIWidth

binWidth(n=200,p=0.02,alternative="two.sided",
 method="Blaker")$expCIWidth

binWidth(n=200,p=0.02,alternative="two.sided",
 method="Score")$expCIWidth

# but do more for small sample sizes and intermediate p:

binWidth(n=20,p=0.2,alternative="two.sided",
 method="CP")$expCIWidth

binWidth(n=20,p=0.2,alternative="two.sided",
 method="Blaker")$expCIWidth

binWidth(n=20,p=0.2,alternative="two.sided",
 method="Score")$expCIWidth




