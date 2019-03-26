library(coin)


### Name: ocarcinoma
### Title: Ovarian Carcinoma
### Aliases: ocarcinoma
### Keywords: datasets

### ** Examples

## Exact logrank test
lt <- logrank_test(Surv(time, event) ~ stadium, data = ocarcinoma,
                   distribution = "exact")

## Test statistic
statistic(lt)

## P-value
pvalue(lt)



