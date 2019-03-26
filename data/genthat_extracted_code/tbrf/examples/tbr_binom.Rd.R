library(tbrf)


### Name: tbr_binom
### Title: Time-Based Rolling Binomial Probability
### Aliases: tbr_binom

### ** Examples

## Generate Sample Data
df <- tibble::data_frame(
date = sample(seq(as.Date('2000-01-01'), as.Date('2015/12/30'), by = "day"), 100),
value = rbinom(100, 1, 0.25)
)

## Run Function
tbr_binom(df, x = value,
tcolumn = date, unit = "years", n = 5,
alpha = 0.1)



