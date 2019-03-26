library(reporttools)


### Name: addLineBreak
### Title: Break lines in a text column of a dataframe.
### Aliases: addLineBreak
### Keywords: manip character

### ** Examples

tab <- data.frame(cbind(1:4))
tab[1, 2] <- paste(letters, sep = "", collapse = "")
tab[3, 2] <- paste(LETTERS, sep = "", collapse = "")
tab[c(2, 4), 2] <- ""
colnames(tab) <- c("nr", "text")

addLineBreak(tab, length = 12, col = 2)



