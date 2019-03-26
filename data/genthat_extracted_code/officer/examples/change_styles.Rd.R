library(officer)


### Name: change_styles
### Title: replace paragraphs styles
### Aliases: change_styles

### ** Examples

library(magrittr)

mapstyles <- list( "centered" = c("Normal"),
    "heading 3" = c("heading 1", "heading 2") )
doc <- read_docx() %>%
  body_add_par("A title", style = "heading 1") %>%
  body_add_par("Another title", style = "heading 2") %>%
  body_add_par("Hello world!", style = "Normal") %>%
  change_styles( mapstyles = mapstyles )

print(doc, target = tempfile(fileext = ".docx"))



