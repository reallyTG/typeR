library(coin)


### Name: asat
### Title: Toxicological Study on Female Wistar Rats
### Aliases: asat
### Keywords: datasets

### ** Examples

## Proof-of-safety based on ratio of medians (Pflueger and Hothorn, 2002)
## One-sided exact Wilcoxon-Mann-Whitney test
wt <- wilcox_test(I(log(asat)) ~ group, data = asat,
                  distribution = "exact", alternative = "less",
                  conf.int = TRUE)

## One-sided confidence set
## Note: Safety cannot be concluded since the effect of the compound
##       exceeds 20 % of the control median
exp(confint(wt)$conf.int)



