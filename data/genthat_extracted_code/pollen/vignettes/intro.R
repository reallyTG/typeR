## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>")

## ---- lib, eval=TRUE-----------------------------------------------------
library(pollen)

## ---- dat, eval=TRUE-----------------------------------------------------
data("pollen_count")
head(pollen_count)

## ---- df, eval=TRUE------------------------------------------------------
df <- subset(pollen_count, site == "Oz")
pollen_season(value = df$birch, date = df$date, method = "95")

## ---- df2, eval=TRUE-----------------------------------------------------
df2 <- subset(pollen_count, site == "Atlantis")
pollen_season(value = df2$alder, date = df2$date, method = "95")

## ---- purrr, eval=TRUE---------------------------------------------------
library(purrr)
pollen_count %>%
  split(., .$site) %>%
  map_dfr(~pollen_season(value = .$hazel, date = .$date, method = "95"), .id = "site")

## ------------------------------------------------------------------------
df <- subset(pollen_count, site == "Oz")

## ------------------------------------------------------------------------
ps_methods <- c("90", "95", "98", "Mesa", "Jager", "Lejoly")
names(ps_methods) <- ps_methods
df_seasons <- ps_methods %>%
  map_dfr(~pollen_season(method = ., value = df$birch, date = df$date), .id = "method")
head(df_seasons)

## ------------------------------------------------------------------------
df <- subset(pollen_count, site == "Shire")
new_df <- outliers_replacer(value = df$alder, date = df$date)
identical(df, new_df)

## ------------------------------------------------------------------------
library("purrr")
new_pollen_count <- pollen_count %>%
  split(., .$site) %>%
  map_dfr(~outliers_replacer(value = .$hazel, date = .$date, threshold = 4))

