library(gsubfn)


### Name: read.pattern
### Title: Read file or text string using a regular expression to separate
###   fields.
### Aliases: read.pattern
### Keywords: misc

### ** Examples

# 3 space-separated fields.  The first field may have embedded spaces.
Lines <- "this is the first field 1 2
more text 3 4
"
pat <- "^(.*) +(\\S+) +(\\S+)$"
read.pattern(text = Lines, pattern = pat, as.is = TRUE)

# 3 space-separated fields.  The last field may have embedded spaces.
Lines2 <- "1 2 this is the first field
3 4 more text
"
pat2 <- "^(\\S+) +(\\S+) +(.*)$"
read.pattern(text = Lines2, pattern = pat2, as.is = TRUE)



