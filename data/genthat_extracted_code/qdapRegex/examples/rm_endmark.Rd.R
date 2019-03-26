library(qdapRegex)


### Name: rm_endmark
### Title: Remove/Replace/Extract Endmarks
### Aliases: rm_endmark ex_endmark
### Keywords: percent

### ** Examples

x <- c("I like the dog.", "I want it *|", "I;", 
    "Who is| that?", "Hello world", "You...")

rm_endmark(x)
ex_endmark(x)

rm_endmark(x, pattern="@rm_endmark2")
ex_endmark(x, pattern="@rm_endmark2")

rm_endmark(x, pattern="@rm_endmark3")
ex_endmark(x, pattern="@rm_endmark3")



