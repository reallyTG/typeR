library(pollen)


### Name: outliers_replacer
### Title: A Outliers Replacer Function
### Aliases: outliers_replacer
### Keywords: outliers pollen pollen,

### ** Examples


data(pollen_count)
df <- subset(pollen_count, site=='Shire')
new_df <- outliers_replacer(df$birch, df$date)
identical(df, new_df)

library('purrr')
new_pollen_count <- pollen_count %>% split(., .$site) %>%
       map_df(~outliers_replacer(value=.$hazel, date=.$date, threshold=4))




