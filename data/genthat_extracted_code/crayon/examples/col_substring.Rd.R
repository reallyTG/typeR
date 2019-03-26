library(crayon)


### Name: col_substring
### Title: Substring(s) of an ANSI colored string
### Aliases: col_substring

### ** Examples

str <- paste(
  red("red"),
  "default",
  green("green")
)

cat(str, "\n")
cat(col_substring(str, 1, 5), "\n")
cat(col_substring(str, 1, 15), "\n")
cat(col_substring(str, 3, 7), "\n")

substring(strip_style(str), 1, 5)
substring(strip_style(str), 1, 15)
substring(strip_style(str), 3, 7)

str2 <- "another " %+%
  red("multi-", sep = "", underline("style")) %+%
  " text"

cat(str2, "\n")
cat(col_substring(str2, c(3,5), c(7, 18)), sep = "\n")
substring(strip_style(str2), c(3,5), c(7, 18))



