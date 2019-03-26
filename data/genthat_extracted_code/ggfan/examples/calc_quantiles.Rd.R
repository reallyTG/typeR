library(ggfan)


### Name: calc_quantiles
### Title: Calculate quantiles of a tidy dataframe
### Aliases: calc_quantiles

### ** Examples


head(fake_df)

fake_q <- calc_quantiles(fake_df, intervals=c(0,0.5,0.8))
head(fake_q)




