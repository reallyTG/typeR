library(multicon)


### Name: e.bars
### Title: Error Bars
### Aliases: e.bars
### Keywords: error bars plotting

### ** Examples

#making random data
y1 <- rnorm(30, mean = 5, sd = 1.5)
y2 <- rnorm(30, mean = 8, sd = 1.2)
#simple barplot
mygraph <- barplot(c(mean(y1),mean(y2)), ylim=c(0,10))
#plotting the error bars 
library(sciplot) # To get the se() function
e.bars(mygraph, c(mean(y1),mean(y2)), ebl=c(se(y1),se(y2)), sides = 2, length = 0.08)



