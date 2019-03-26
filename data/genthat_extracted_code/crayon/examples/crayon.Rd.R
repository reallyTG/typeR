library(crayon)


### Name: crayon
### Title: Colored terminal output
### Aliases: crayon crayon-package crayon reset bold blurred italic
###   underline inverse hidden strikethrough black red green yellow blue
###   magenta cyan white silver bgBlack bgRed bgGreen bgYellow bgBlue
###   bgMagenta bgCyan bgWhite

### ** Examples

cat(blue("Hello", "world!"))

cat("... to highlight the " %+% red("search term") %+%
    " in a block of text")

cat(yellow$bgMagenta$bold('Hello world!'))

cat(green(
 'I am a green line ' %+%
 blue$underline$bold('with a blue substring') %+%
 ' that becomes green again!'
))

error <- red $ bold
warn <- magenta $ underline
note <- cyan
cat(error("Error: subscript out of bounds!\n"))
cat(warn("Warning: shorter argument was recycled.\n"))
cat(note("Note: no such directory.\n"))




