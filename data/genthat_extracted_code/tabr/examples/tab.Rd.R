library(tabr)


### Name: tab
### Title: Create tablature
### Aliases: tab

### ** Examples

if(tabr_options()$lilypond != ""){
  x <- phrase("c ec'g' ec'g'", "4 4 2", "5 432 432")
  x <- track(x)
  x <- score(x)
  outfile <- file.path(tempdir(), "out.pdf")
  tab(x, outfile, details = FALSE) # requires LilyPond installation
}



