library(gutenbergr)


### Name: gutenberg_works
### Title: Get a filtered table of Gutenberg work metadata
### Aliases: gutenberg_works

### ** Examples


library(dplyr)

gutenberg_works()

# filter conditions
gutenberg_works(author == "Shakespeare, William")

# language specifications

gutenberg_works(languages = "es") %>%
  count(language, sort = TRUE)

gutenberg_works(languages = c("en", "es")) %>%
  count(language, sort = TRUE)

gutenberg_works(languages = c("en", "es"), all_languages = TRUE) %>%
  count(language, sort = TRUE)

gutenberg_works(languages = c("en", "es"), only_languages = FALSE) %>%
  count(language, sort = TRUE)




