library(crayon)


### Name: col_strsplit
### Title: Split an ANSI colored string
### Aliases: col_strsplit

### ** Examples

str <- red("I am red---") %+%
  green("and I am green-") %+%
  underline("I underlined")

cat(str, "\n")

# split at dashes, keep color
cat(col_strsplit(str, "[-]+")[[1]], sep = "\n")
strsplit(strip_style(str), "[-]+")

# split to characters, keep color
cat(col_strsplit(str, "")[[1]], "\n", sep = " ")
strsplit(strip_style(str), "")



