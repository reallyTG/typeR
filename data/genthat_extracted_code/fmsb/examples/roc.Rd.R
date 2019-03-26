library(fmsb)


### Name: roc
### Title: Calculate Receiver Operating Characteristic (ROC) curve
### Aliases: roc print.roc plot.roc

### ** Examples

 scores <- c(15, 20, 19, 28, 26, 17, 13, 22, 23, 24)
 diagno <- c(0, 0, 0, 1, 1, 1, 0, 1, 1, 1)
 res <- roc(scores, diagno)
 print(res)
 plot(res)



