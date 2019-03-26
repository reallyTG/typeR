library(officer)


### Name: docx_bookmarks
### Title: List Word bookmarks
### Aliases: docx_bookmarks

### ** Examples

library(magrittr)

doc <- read_docx() %>%
  body_add_par("centered text", style = "centered") %>%
  body_bookmark("text_to_replace") %>% body_add_par("centered text", style = "centered") %>%
  body_bookmark("text_to_replace2")

docx_bookmarks(doc)

docx_bookmarks(read_docx())



