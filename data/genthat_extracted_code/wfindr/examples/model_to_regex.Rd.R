library(wfindr)


### Name: model_to_regex
### Title: Build a regular expression to fit chosen parameters
### Aliases: model_to_regex

### ** Examples

## Regular expression to match all the 5-letter words starting with "c".
model_to_regex("c.{4}")
## Disallow "a" and "b".
model_to_regex("c.{4}", ban = "ab")
## Allow only "a" and "b" to fill the gap.
model_to_regex("c.{4}", allow = "ab")
## Allow "a", "b", and "c", but then ban "c" (result is the same as the previous example)
model_to_regex("c.{4}", allow = "abc", ban = "c")

## Regex to match all words that start with "p" and end with "zed".
model_to_regex("p*zed")

## Regex to match all the words that can be constructed of the word "thing".
model_to_regex(allow = "thing", type = "scrabble")
## Get at lest 4-letter words.
model_to_regex(".{4,}", allow = "thing", type = "scrabble")

## Regex to match anagrams of the word "thing"
model_to_regex(allow = "thing", type = "anagram")




