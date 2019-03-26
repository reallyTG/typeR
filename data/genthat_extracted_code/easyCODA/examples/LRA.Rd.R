library(easyCODA)


### Name: LRA
### Title: Logratio analysis
### Aliases: LRA
### Keywords: multivariate

### ** Examples

# (weighted) LRA of the RomanCups data set, showing default symmetric map
data(cups)
PLOT.LRA(LRA(cups))
# all the examples below use the data set 'author' and the plot.ca function from 
# the ca package; alternatively, PLOT.LRA can be used (see first example below)
data(author)
which(author == 0, arr.ind = TRUE)
# row 5 (Farewell to Arms) and col 17 (Q) has a zero
# replace it with 0.5 for the logratio analysis
author[5,17] <- 0.5
# form compositional table of relative frequencies
author.comp <- author / apply(author, 1, sum)
# (weighted) logratio analysis (default is weighted = TRUE)
author.LRA1 <- LRA(author.comp)
plot(author.LRA1)	
PLOT.LRA(author.LRA1)
# unweighted logratio analysis
author.LRA2 <- LRA(author.comp, weight = FALSE)
plot(author.LRA2)
# identical to unweighted logratio analysis by specifying equal column weights
author.LRA3 <- LRA(author.comp, weight = rep(1/ncol(author), ncol(author)))
plot(author.LRA3)
# supplementary rows example (they are plotted with empty circle symbols)
# two books by Arthur C. Clark made supplementary
author.LRA4 <- LRA(author.comp, suprow = c(3,8))
plot(author.LRA4)
# make vowels an amalagamation
author.vowels <- c(1,5,9,15,21)
author.LRA5 <- LRA(author.comp, amalg = list(vowels = author.vowels))
# contribution biplot, just labels plotted, no symbols
plot(author.LRA5, labels=c(1,1), map="rowgreen")



