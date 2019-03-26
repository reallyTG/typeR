library(tabr)


### Name: lilypond
### Title: Save score to LilyPond file
### Aliases: lilypond

### ** Examples

x <- phrase("c ec'g' ec'g'", "4 4 2", "5 432 432")
x <- track(x)
x <- score(x)
outfile <- file.path(tempdir(), "out.ly")
lilypond(x, outfile)



