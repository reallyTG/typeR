library(wordcloud2)


### Name: wordcloud2
### Title: Create wordcloud by wordcloud2.js
### Aliases: wordcloud2

### ** Examples

library(wordcloud2)
# Global variables can go here



wordcloud2(demoFreq)
wordcloud2(demoFreq, size = 2)

wordcloud2(demoFreq, size = 1,shape = 'pentagon')
wordcloud2(demoFreq, size = 1,shape = 'star')

wordcloud2(demoFreq, size = 2,
           color = "random-light", backgroundColor = "grey")

wordcloud2(demoFreq, size = 2, minRotation = -pi/2, maxRotation = -pi/2)
wordcloud2(demoFreq, size = 2, minRotation = -pi/6, maxRotation = -pi/6,
  rotateRatio = 1)
wordcloud2(demoFreq, size = 2, minRotation = -pi/6, maxRotation = pi/6,
  rotateRatio = 0.9)

wordcloud2(demoFreqC, size = 2,
           color = "random-light", backgroundColor = "grey")
wordcloud2(demoFreqC, size = 2, minRotation = -pi/6, maxRotation = -pi/6,
  rotateRatio = 1)

# Color Vector

colorVec = rep(c('red', 'skyblue'), length.out=nrow(demoFreq))
wordcloud2(demoFreq, color = colorVec, fontWeight = "bold")

wordcloud2(demoFreq,
  color = ifelse(demoFreq[, 2] > 20, 'red', 'skyblue'))



