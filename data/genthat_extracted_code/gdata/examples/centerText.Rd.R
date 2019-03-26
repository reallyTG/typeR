library(gdata)


### Name: centerText
### Title: Center Text Strings
### Aliases: centerText
### Keywords: manip character

### ** Examples

cat(centerText("One Line Test"), "\n\n")

mText <-c("This", "is an example",
          " of a multiline text    ",
          "with ",
          "          leading",
          " and trailing         ",
          "spaces.")
cat("\n", centerText(mText), "\n", sep="\n")



