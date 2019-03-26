library(gutenbergr)


### Name: gutenberg_metadata
### Title: Gutenberg metadata about each work
### Aliases: gutenberg_metadata
### Keywords: datasets

### ** Examples


library(dplyr)
library(stringr)

gutenberg_metadata

gutenberg_metadata %>%
  count(author, sort = TRUE)

# look for Shakespeare, excluding collections (containing "Works") and translations
shakespeare_metadata <- gutenberg_metadata %>%
  filter(author == "Shakespeare, William",
         language == "en",
         !str_detect(title, "Works"),
         has_text,
         !str_detect(rights, "Copyright")) %>%
         distinct(title)

## Not run: 
##D shakespeare_works <- gutenberg_download(shakespeare_metadata$gutenberg_id)
## End(Not run)

# note that the gutenberg_works() function filters for English
# non-copyrighted works and does de-duplication by default:

shakespeare_metadata2 <- gutenberg_works(author == "Shakespeare, William",
                                         !str_detect(title, "Works"))

# date last updated
attr(gutenberg_metadata, "date_updated")




