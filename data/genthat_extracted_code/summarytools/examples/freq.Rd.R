library(summarytools)


### Name: freq
### Title: Frequency Tables for Factors and Other Discrete Data
### Aliases: freq
### Keywords: category classes univar

### ** Examples

data(tobacco)
freq(tobacco$gender)
freq(tobacco$gender, totals = FALSE)
freq(tobacco$gender, display.nas = FALSE)
freq(tobacco$gender, style="rmarkdown")
with(tobacco, view(by(diseased, smoker, freq), method = "pander"))




