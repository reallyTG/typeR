library(styler)


### Name: style_file
### Title: Style '.R', '.Rmd' or '.Rnw' files
### Aliases: style_file

### ** Examples

# the following is identical but the former is more convenient:
file <- tempfile("styler", fileext = ".R")
xfun::write_utf8("1++1", file)
style_file(file, style = tidyverse_style, strict = TRUE)
style_file(file, transformers = tidyverse_style(strict = TRUE))
xfun::read_utf8(file)
unlink(file)



