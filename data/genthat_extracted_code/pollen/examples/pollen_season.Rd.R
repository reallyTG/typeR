library(pollen)


### Name: pollen_season
### Title: A Pollen Season Function
### Aliases: pollen_season
### Keywords: pollen pollen, season

### ** Examples


data(pollen_count)
df <- subset(pollen_count, site=='Oz')
pollen_season(value=df$birch, date=df$date, method="95")

df2 <- subset(pollen_count, site=='Atlantis')
pollen_season(value=df2$alder, date=df2$date, method="95")

library('purrr')
pollen_count %>% split(., .$site) %>%
                 map_df(~pollen_season(value=.$hazel, date=.$date, method="95"), .id="site")




