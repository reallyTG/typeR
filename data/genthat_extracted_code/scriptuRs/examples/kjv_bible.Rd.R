library(scriptuRs)


### Name: kjv_bible
### Title: Tidy data frame of the King James Version of the Bible
### Aliases: kjv_bible

### ** Examples

library(dplyr)

kjv_bible() %>%
  group_by(volume_title, book_title) %>%
  summarise(total_verses = n())




