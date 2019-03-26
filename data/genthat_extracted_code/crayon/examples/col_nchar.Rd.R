library(crayon)


### Name: col_nchar
### Title: Count number of characters in an ANSI colored string
### Aliases: col_nchar

### ** Examples

str <- paste(
  red("red"),
  "default",
  green("green")
)

cat(str, "\n")
nchar(str)
col_nchar(str)
nchar(strip_style(str))



