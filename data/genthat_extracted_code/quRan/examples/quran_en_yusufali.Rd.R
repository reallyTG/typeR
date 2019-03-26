library(quRan)


### Name: quran_en_yusufali
### Title: The Yusuf Ali translation of the Qur'an (English)
### Aliases: quran_en_yusufali
### Keywords: datasets

### ** Examples

# See first few rows
head(quran_en_yusufali)

# How many ayahs are in each surah?
library(dplyr)

quran_en_yusufali %>%
  group_by(surah_title_en) %>%
  summarize(total_ayaat = n())



