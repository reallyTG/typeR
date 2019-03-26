library(RJSplot)


### Name: wordcloud_rjs
### Title: Draw a wordcloud.
### Aliases: wordcloud_rjs

### ** Examples

## Create an interactive heatmap in the folder "WordCloud" of your local machine
## Live examples on http://rjsplot.net

## Format test data
words <- data.frame(word = rownames(USArrests), freq = USArrests[,4])

# Create WordCloud
wordcloud_rjs(words)



