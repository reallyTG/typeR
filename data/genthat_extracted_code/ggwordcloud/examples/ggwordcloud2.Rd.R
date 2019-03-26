library(ggwordcloud)


### Name: ggwordcloud2
### Title: wordcloud2 approximate replacement
### Aliases: ggwordcloud2

### ** Examples

set.seed(42)
data("love_words_small")

ggwordcloud2(love_words_small[,c("word", "speakers")])



