library(meme)


### Name: meme_save
### Title: meme_save
### Aliases: meme_save

### ** Examples

f <- system.file("angry8.jpg", package="meme")
x <- meme(f, "code", "all the things!")
outfile <- tempfile(fileext = ".png")
meme_save(x, outfile)



