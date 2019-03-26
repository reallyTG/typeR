library(officer)


### Name: body_bookmark
### Title: add bookmark
### Aliases: body_bookmark

### ** Examples


# cursor_bookmark ----
library(magrittr)

doc <- read_docx() %>%
  body_add_par("centered text", style = "centered") %>%
  body_bookmark("text_to_replace")



