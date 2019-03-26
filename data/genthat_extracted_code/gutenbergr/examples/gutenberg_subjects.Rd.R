library(gutenbergr)


### Name: gutenberg_subjects
### Title: Gutenberg metadata about the subject of each work
### Aliases: gutenberg_subjects
### Keywords: datasets

### ** Examples


library(dplyr)
library(stringr)

gutenberg_subjects %>%
  filter(subject_type == "lcsh") %>%
  count(subject, sort = TRUE)

sherlock_holmes_subjects <- gutenberg_subjects %>%
  filter(str_detect(subject, "Holmes, Sherlock"))

sherlock_holmes_subjects

sherlock_holmes_metadata <- gutenberg_works() %>%
  filter(author == "Doyle, Arthur Conan") %>%
  semi_join(sherlock_holmes_subjects, by = "gutenberg_id")

sherlock_holmes_metadata

## Not run: 
##D holmes_books <- gutenberg_download(sherlock_holmes_metadata$gutenberg_id)
##D 
##D holmes_books
## End(Not run)

# date last updated
attr(gutenberg_subjects, "date_updated")




