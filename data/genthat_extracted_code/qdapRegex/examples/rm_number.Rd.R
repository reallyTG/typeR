library(qdapRegex)


### Name: rm_number
### Title: Remove/Replace/Extract Numbers
### Aliases: rm_number as_numeric as_numeric2 ex_number
### Keywords: number

### ** Examples

x <- c("-2 is an integer.  -4.3 and 3.33 are not.",
    "123,456 is 0 alot -123456 more than -.2", "and 3456789123 fg for 345.",
    "fg 12,345 23 .44 or 18.", "don't remove this 444,44", "hello world -.q")

rm_number(x)
ex_number(x)

##Convert to numeric
as_numeric(ex_number(x))   # retain list
as_numeric2(ex_number(x))  # unlist



