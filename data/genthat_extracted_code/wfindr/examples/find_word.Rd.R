library(wfindr)


### Name: find_word
### Title: Find words that fit the chosen parameters.
### Aliases: find_word find_word_l

### ** Examples

## Search 4-letter words starting with "c".
find_word("c.{3}")
## Disallow "a" and "b".
find_word("c.{3}", ban = "ab")
## Allow only "a" and "b" to fill the gap.
find_word("c.{3}", allow = "ab")
## Allow "a", "b", and "c", but then ban "c"
## result is the same as in the previous example
find_word("c.{3}", allow = "abc", ban = "c")

## Find no more than 4-letter words that have "th" bigram
library(magrittr)
find_word(".{0,4}") %>% find_word("*th*", words = .)
## count words that start with "th"
sum(find_word_l("th*"))
length(find_word("th*"))

## Find words that can be constructed of the "thing" word's letters.
find_word(allow = "thing", type = "scrabble")
## Get at lest 4-letter words.
find_word(".{4,}", allow = "thing", type = "scrabble")

## Find anagrams of the word "thing"
find_word(allow = "thing", type = "anagram")



