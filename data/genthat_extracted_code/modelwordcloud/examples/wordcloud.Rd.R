library(modelwordcloud)


### Name: wordcloud
### Title: Make a word cloud.
### Aliases: wordcloud

### ** Examples

  data(iris)
  model <- lm(Petal.Width ~ Species, iris)
  library(modelwordcloud)
  colors <- c("red", "orange", "blue")
  wordcloud(model, colors = colors)
  words_and_freqs <- rle(as.character(iris$Species))
  freqs <- words_and_freqs$lengths
  words <- words_and_freqs$values
  coefficients <- model$coefficients
  wordcloud(words = words, freq = freqs, coefficients = coefficients, colors = colors)



