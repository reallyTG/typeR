library(corpus)


### Name: text_sub
### Title: Text Subsequences
### Aliases: text_sub

### ** Examples

x <- as_corpus_text(c("A man, a plan.", "A \"canal\"?", "Panama!"),
                    drop_punct = TRUE)

# entire text
text_sub(x, 1, -1)

# first three elements
text_sub(x, 1, 3)

# last two elements
text_sub(x, -2, -1)



