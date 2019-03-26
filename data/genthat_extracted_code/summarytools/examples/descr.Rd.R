library(summarytools)


### Name: descr
### Title: Univariate Statistics for Numerical Data
### Aliases: descr
### Keywords: univar

### ** Examples

data(exams)
descr(exams)
descr(exams, stats = c("mean", "sd", "min", "max"), transpose = TRUE)
data(tobacco)
with(tobacco, view(by(BMI, gender, descr), method = "pander"))




