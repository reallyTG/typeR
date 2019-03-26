library(corpus)


### Name: print.corpus_frame
### Title: Corpus Data Frame Printing
### Aliases: format.corpus_frame print.corpus_frame

### ** Examples

# default data frame printing
x <- data.frame(text = c("hello world", intToUtf8(0x1f638 + 0:3), letters))
print(x)

# corpus frame printing
y <- x
class(y) <- c("corpus_frame", "data.frame")
print(y)

print(y, 10) # change truncation limit



