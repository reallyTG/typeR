library(stringi)


### Name: stri_rand_lipsum
### Title: A Lorem Ipsum Generator
### Aliases: stri_rand_lipsum

### ** Examples

cat(sapply(
   stri_wrap(stri_rand_lipsum(10), 80, simplify=FALSE),
   stri_flatten, collapse="\n"), sep="\n\n")
cat(stri_rand_lipsum(10), sep="\n\n")




