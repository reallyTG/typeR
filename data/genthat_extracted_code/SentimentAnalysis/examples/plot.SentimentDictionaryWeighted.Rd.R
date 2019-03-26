library(SentimentAnalysis)


### Name: plot.SentimentDictionaryWeighted
### Title: KDE plot of estimated coefficients
### Aliases: plot.SentimentDictionaryWeighted
### Keywords: evaluation plots

### ** Examples

d <- SentimentDictionaryWeighted(paste0(character(100), 1:100), rnorm(100), numeric(100))
plot(d)

# Change color in plot
plot(d, color="red")

library(ggplot2)
# Extend plot with additional layout options
plot(d) + ggtitle("KDE plot")
plot(d) + theme_void() 



