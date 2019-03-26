library(tmcn)


### Name: strextract
### Title: Extract matched substrings by regular expression.
### Aliases: strextract
### Keywords: string

### ** Examples

txt1 <- c("\t(x1)a(aa2)a ", " bb(bb)")
strextract(txt1, "\\([^)]*\\)")
txt2 <- c("  Ben Franklin and Jefferson Davis", "\tMillard Fillmore")
strextract(txt2, "(?<first>[[:upper:]][[:lower:]]+)", perl = TRUE)





