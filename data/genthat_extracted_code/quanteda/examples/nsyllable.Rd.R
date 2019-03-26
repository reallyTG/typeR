library(quanteda)


### Name: nsyllable
### Title: Count syllables in a text
### Aliases: nsyllable

### ** Examples

# character
nsyllable(c("cat", "syllable", "supercalifragilisticexpialidocious", 
            "Brexit", "Administration"), use.names = TRUE)

# tokens
txt <- c(doc1 = "This is an example sentence.",
         doc2 = "Another of two sample sentences.")
nsyllable(tokens(txt, remove_punct = TRUE))
# punctuation is not counted
nsyllable(tokens(txt), use.names = TRUE)



