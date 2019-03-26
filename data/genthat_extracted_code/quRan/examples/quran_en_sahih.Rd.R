library(quRan)


### Name: quran_en_sahih
### Title: The Saheeh International translation of the Qur'an (English)
### Aliases: quran_en_sahih
### Keywords: datasets

### ** Examples

# See first few rows
head(quran_en_sahih)

# How many ayahs are in each surah?
library(dplyr)

quran_en_sahih %>%
  group_by(surah_title_en) %>%
  summarize(total_ayaat = n())



