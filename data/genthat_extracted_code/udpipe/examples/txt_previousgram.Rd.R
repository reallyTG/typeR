library(udpipe)


### Name: txt_previousgram
### Title: Based on a vector with a word sequence, get n-grams (looking
###   backward)
### Aliases: txt_previousgram

### ** Examples

x <- sprintf("%s%s", LETTERS, 1:26)
txt_previousgram(x, n = 2)

data.frame(words = x,
           bigram = txt_previousgram(x, n = 2),
           trigram = txt_previousgram(x, n = 3, sep = "-"),
           quatrogram = txt_previousgram(x, n = 4, sep = ""),
           stringsAsFactors = FALSE)

x <- c("A1", "A2", "A3", NA, "A4", "A5")
data.frame(x, 
           bigram = txt_previousgram(x, n = 2, sep = "_"),
           stringsAsFactors = FALSE)



