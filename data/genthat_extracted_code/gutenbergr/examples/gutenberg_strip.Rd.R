library(gutenbergr)


### Name: gutenberg_strip
### Title: Strip header and footer content from a Project Gutenberg book
### Aliases: gutenberg_strip

### ** Examples


library(dplyr)
book <- gutenberg_works(title == "Pride and Prejudice") %>%
  gutenberg_download(strip = FALSE)

head(book$text, 10)
tail(book$text, 10)

text_stripped <- gutenberg_strip(book$text)

head(text_stripped, 10)
tail(text_stripped, 10)




