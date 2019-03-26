library(statsDK)


### Name: fix_time
### Title: Fixes the time column of a data set
### Aliases: fix_time

### ** Examples

df <- statsDK::retrieve_data("FOLK1A", TID = "*", ALDER = "IALT",
                             CIVILSTAND = "TOT", lang = "da")
dplyr::glimpse(df)

df$TID <- statsDK::fix_time(df$TID)
dplyr::glimpse(df)




