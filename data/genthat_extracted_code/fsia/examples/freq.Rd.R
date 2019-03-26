library(fsia)


### Name: freq
### Title: Absolute and Percentage Frequencies of the Responses to the
###   Items.
### Aliases: freq print.frlist plot.frlist

### ** Examples

data(test)
data(key)
testk <- addkey(test, keydata = key)

fr <- freq(obj = testk, col = c("Question03", "Question04"))
fr
par(mfrow=c(1,2))
plot(fr, ask = FALSE)
fr <- freq(obj = testk, col = 2:11, perc = TRUE)
fr
par(mfrow = c(2,5))
plot(fr, ask = FALSE)



