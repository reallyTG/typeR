library(textclean)


### Name: swap
### Title: Swap Two Patterns Simultaneously
### Aliases: swap

### ** Examples

x <- c("hash_abbreviation", "hash_contractions", "hash_grade", "key_emoticons", 
    "key_power", "key_sentiment", "key_sentiment_nrc", "key_strength", 
    "key_syllable", "key_valence_shifters")

x
swap(x, 'hash_', 'key_')



