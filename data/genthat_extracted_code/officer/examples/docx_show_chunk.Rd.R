library(officer)


### Name: docx_show_chunk
### Title: Show underlying text tag structure
### Aliases: docx_show_chunk

### ** Examples

library(magrittr)

doc <- read_docx() %>%
  body_add_par("Placeholder one") %>%
  body_add_par("Placeholder two")

# Show text chunk at cursor
docx_show_chunk(doc)  # Output is 'Placeholder two'



