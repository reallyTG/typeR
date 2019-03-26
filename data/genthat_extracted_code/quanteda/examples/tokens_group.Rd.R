library(quanteda)


### Name: tokens_group
### Title: Recombine documents tokens by groups
### Aliases: tokens_group
### Keywords: internal tokens

### ** Examples

# dfm_group examples
corp <- corpus(c("a a b", "a b c c", "a c d d", "a c c d"), 
                   docvars = data.frame(grp = c("grp1", "grp1", "grp2", "grp2")))
toks <- tokens(corp)
quanteda:::tokens_group(toks, groups = "grp")
quanteda:::tokens_group(toks, groups = c(1, 1, 2, 2))
quanteda:::tokens_group(toks, groups = factor(c(1, 1, 2, 2), levels = 1:3))



