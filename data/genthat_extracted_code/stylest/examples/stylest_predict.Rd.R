library(stylest)


### Name: stylest_predict
### Title: Predict the most likely speaker of a text
### Aliases: stylest_predict

### ** Examples

data(novels_excerpts)
speaker_mod <- stylest_fit(novels_excerpts$text, novels_excerpts$author)
stylest_predict(speaker_mod, "This is an example text, who wrote it?")
  



