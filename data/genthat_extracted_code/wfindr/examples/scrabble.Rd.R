library(wfindr)


### Name: scrabble
### Title: Find words that can be constructed from the specified letters
### Aliases: anagram scrabble

### ** Examples

## Find all words that can be constructed of the "thing" word's letters
scrabble("thing")
## same as
find_word(allow = "thing", type = "s")
## take at least 4-letter words
scrabble("thing", ".{4,}")
## same as
find_word(".{4,}", "thing", type = "s")

## Pick 8 random letters and find words that can be constructed of them.
library(magrittr)
sample(letters, 8, TRUE) %>% list(letters = ., words = scrabble(.))

## Find anagrams of the word "thing"
anagram("thing")




