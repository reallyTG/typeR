library(labstatR)


### Name: bubbleplot
### Title: Disegna un grafico a bolle
### Aliases: bubbleplot
### Keywords: multivariate

### ** Examples

x <- c("O","O","S","B","S","O","B","B","S",
   "B","O","B","B","O","S")
y <- c("O","B","B","B","S","S","O","O","B",
   "B","O","S","B","S","B")
x <- ordered(x, levels=c("S","B","O")) 
y <- ordered(y, levels=c("S","B","O")) 
table(x,y)
bubbleplot(table(x,y),main="Musica versus Pittura")



