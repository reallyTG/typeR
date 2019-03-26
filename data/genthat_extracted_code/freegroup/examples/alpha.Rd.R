library(freegroup)


### Name: alpha
### Title: Single-symbol words
### Aliases: alpha alphabet

### ** Examples

alpha(1)  # just the letter 'a'


alpha(1:26)  # the whole alphabet; compare abc(1:26)

all(alpha(1:26) == as.free(letters))  # should be TRUE

z <- alpha(26)  # variable 'z' is symbol 26, aka 'z'.
abc(1:10) ^ z

abc(-5:5)
sum(abc(-5:5))


## bear in mind that the symbols used are purely for the print method:
jj <- LETTERS[1:10]
options(symbols = apply(expand.grid(jj,jj),1,paste,collapse=""))
alpha(c(66,67,68,69))   # sensible output
options(symbols=NULL)   # restore to symbols to default letters
alpha(c(66,67,68,69))   # print method not very helpful now



