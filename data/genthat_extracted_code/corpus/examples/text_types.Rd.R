library(corpus)


### Name: text_types
### Title: Text Type Sets
### Aliases: text_ntype text_types

### ** Examples

text <- c("I saw Mr. Jones today.",
          "Split across\na line.",
          "What. Are. You. Doing????",
          "She asked 'do you really mean that?' and I said 'yes.'")

# count the number of unique types
text_ntype(text)
text_ntype(text, collapse = TRUE)

# get the type sets
text_types(text)
text_types(text, collapse = TRUE)



