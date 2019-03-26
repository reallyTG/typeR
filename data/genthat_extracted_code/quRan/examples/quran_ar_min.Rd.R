library(quRan)


### Name: quran_ar_min
### Title: The text of the Qur'an (Arabic, no vowels)
### Aliases: quran_ar_min
### Keywords: datasets

### ** Examples

# See first few rows
head(quran_ar_min)

# How many ayahs are in each surah?
library(dplyr)

quran_ar_min %>%
  group_by(surah_title_ar) %>%
  summarize(total_ayaat = n())



