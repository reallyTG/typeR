library(quRan)


### Name: quran_ar
### Title: The text of the Qur'an (Arabic, all vowels)
### Aliases: quran_ar
### Keywords: datasets

### ** Examples

# See first few rows
head(quran_ar)

# How many ayahs are in each surah?
library(dplyr)

quran_ar %>%
  group_by(surah_title_ar) %>%
  summarize(total_ayaat = n())



