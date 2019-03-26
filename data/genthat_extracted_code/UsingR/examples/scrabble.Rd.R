library(UsingR)


### Name: scrabble
### Title: Distribution of Scrabble pieces
### Aliases: scrabble
### Keywords: datasets

### ** Examples

data(scrabble)
## perform chi-squared analysis on long string. Is it in English?
quote = " R is a language and environment for statistical computing  \
and graphics. It is a GNU project which is similar to the S language \
and environment which was developed at Bell Laboratories (formerly   \
AT&T, now Lucent Technologies) by John Chambers and colleagues. R    \
can be considered as a different implementation of S. There are      \
some important differences, but much code written for S runs         \
unaltered under R."
quote.lc = tolower(quote)
quote = unlist(strsplit(quote.lc,""))
ltr.dist = sapply(c(letters," "),function(x) sum(quote == x))
chisq.test(ltr.dist,,scrabble$freq)




