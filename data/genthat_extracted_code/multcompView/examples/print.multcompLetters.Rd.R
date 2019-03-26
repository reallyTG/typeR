library(multcompView)


### Name: print.multcompLetters
### Title: print a multcompLetters object
### Aliases: print.multcompLetters
### Keywords: dplot

### ** Examples

dif3 <- c(FALSE, FALSE, TRUE)
names(dif3) <- c("A-B", "A-C", "B-C")
dif3L <- multcompLetters(dif3)
dif3L
print(dif3L)
print(dif3L, TRUE)



