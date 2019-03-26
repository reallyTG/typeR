library(ExPanDaR)


### Name: treat_outliers
### Title: Treats Outliers in Numerical Data
### Aliases: treat_outliers

### ** Examples

treat_outliers(seq(1:100), 0.05)
treat_outliers(seq(1:100), truncate = TRUE, 0.05)

# When you like the percentiles calculated like STATA's summary or pctile:
treat_outliers(seq(1:100), 0.05, type = 2)

df <- data.frame(a = seq(1:1000), b = rnorm(1000), c = sample(LETTERS[1:5], 1000, replace=TRUE))
winsorized_df <- treat_outliers(df)
summary(df)
summary(winsorized_df)

winsorized_df <- treat_outliers(df, 0.05, by="c")
by(df, df$c, summary)
by(winsorized_df, df$c, summary)

hist(treat_outliers(rnorm(1000)), breaks=100)



