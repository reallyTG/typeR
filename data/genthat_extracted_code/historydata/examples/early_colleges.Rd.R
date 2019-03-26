library(historydata)


### Name: early_colleges
### Title: Early colleges in the United States
### Aliases: early_colleges
### Keywords: datasets

### ** Examples

head(early_colleges)
if(require(ggplot2)) {
  ggplot(early_colleges, aes(x = established)) + geom_bar(binwidth = 5) +
  ggtitle("Founding Dates of Early American Colleges")
}



