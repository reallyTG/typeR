library(scriptuRs)


### Name: lds_scriptures
### Title: Tidy data frame of the LDS scriptures
### Aliases: lds_scriptures

### ** Examples

library(dplyr)

lds_scriptures() %>%
  group_by(volume_title, book_title) %>%
  summarise(total_verses = n())




