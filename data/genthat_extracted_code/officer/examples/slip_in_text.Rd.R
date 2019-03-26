library(officer)


### Name: slip_in_text
### Title: append text
### Aliases: slip_in_text

### ** Examples

library(magrittr)
x <- read_docx() %>%
  body_add_par("Hello ", style = "Normal") %>%
  slip_in_text("world", style = "strong") %>%
  slip_in_text("Message is", style = "strong", pos = "before")

print(x, target = tempfile(fileext = ".docx"))



