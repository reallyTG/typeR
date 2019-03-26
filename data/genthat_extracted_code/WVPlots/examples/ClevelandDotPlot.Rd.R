library(WVPlots)


### Name: ClevelandDotPlot
### Title: Plot a Cleveland dot plot.
### Aliases: ClevelandDotPlot

### ** Examples


set.seed(34903490)
# discrete variable: letters of the alphabet
# frequencies of letters in English
# source: http://en.algoritmy.net/article/40379/Letter-frequency-English
letterFreqs = c(8.167, 1.492, 2.782, 4.253, 12.702, 2.228,
                2.015, 6.094, 6.966, 0.153, 0.772, 4.025, 2.406, 6.749, 7.507, 1.929,
                0.095, 5.987, 6.327, 9.056, 2.758, 0.978, 2.360, 0.150, 1.974, 0.074)
letterFreqs = letterFreqs/100
letterFrame = data.frame(letter = letters, freq=letterFreqs)
# now let's generate letters according to their letter frequencies
N = 1000
randomDraws = data.frame(draw=1:N,
  letter=sample(letterFrame$letter, size=N,
  replace=TRUE, prob=letterFrame$freq))
WVPlots::ClevelandDotPlot(randomDraws, "letter",
  title = "Example Cleveland-style dot plot")

# Note the use of sort = 0, and that the graph correctly includes counts
# with no occurrences (5, and 7)
WVPlots::ClevelandDotPlot(mtcars, "carb", sort = 0, "Example of counting integer values")



