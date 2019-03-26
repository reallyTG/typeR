library(BSDA)


### Name: Bookstor
### Title: Prices paid for used books at three different bookstores
### Aliases: Bookstor
### Keywords: datasets

### ** Examples


boxplot(dollars ~ store, data = Bookstor, 
        col = c("purple", "lightblue", "cyan"))
kruskal.test(dollars ~ store, data = Bookstor)




