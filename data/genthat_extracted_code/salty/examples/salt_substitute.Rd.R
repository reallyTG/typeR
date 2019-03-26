library(salty)


### Name: salt_substitute
### Title: Substitute certain characters in a vector
### Aliases: salt_substitute

### ** Examples

x <- c("Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
       "Nunc finibus tortor a elit eleifend interdum.",
       "Maecenas aliquam augue sit amet ultricies placerat.")

salt_substitute(x, shaker$digits, p = 0.5, n = 5)



