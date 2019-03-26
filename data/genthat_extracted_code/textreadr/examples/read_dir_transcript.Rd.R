library(textreadr)


### Name: read_dir_transcript
### Title: Read In Multiple Transcript Files From a Directory
### Aliases: read_dir_transcript

### ** Examples

skips <- c(0, 1, 1, 0, 0, 1)
path <- system.file("docs/transcripts", package = 'textreadr')
textreadr::peek(read_dir_transcript(path, skip = skips), Inf)

## Not run: 
##D ## with additional  cleaning
##D library(tidyverse, textshape, textclean)
##D 
##D path %>%
##D     read_dir_transcript(skip = skips) %>%
##D     textclean::filter_row("Person", "^\\[") %>%
##D     mutate(
##D         Person = stringi::stri_replace_all_regex(Person, "(^/\\s*)|(:\\s*$)", "") %>%
##D             trimws(),
##D         Dialogue = stringi::stri_replace_all_regex(Dialogue, "(^/\\s*)", "")
##D     ) %>%
##D     peek(Inf)
## End(Not run)



