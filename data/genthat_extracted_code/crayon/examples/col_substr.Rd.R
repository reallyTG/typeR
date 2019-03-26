library(crayon)


### Name: col_substr
### Title: Substring(s) of an ANSI colored string
### Aliases: col_substr

### ** Examples

str <- paste(
  red("red"),
  "default",
  green("green")
)

cat(str, "\n")
cat(col_substr(str, 1, 5), "\n")
cat(col_substr(str, 1, 15), "\n")
cat(col_substr(str, 3, 7), "\n")

substr(strip_style(str), 1, 5)
substr(strip_style(str), 1, 15)
substr(strip_style(str), 3, 7)

str2 <- "another " %+%
  red("multi-", sep = "", underline("style")) %+%
  " text"

cat(str2, "\n")
cat(col_substr(c(str, str2), c(3,5), c(7, 18)), sep = "\n")
substr(strip_style(c(str, str2)), c(3,5), c(7, 18))



