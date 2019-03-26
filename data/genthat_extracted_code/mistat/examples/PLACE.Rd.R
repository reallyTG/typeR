library(mistat)


### Name: PLACE
### Title: Displacements of Electronic Components on Printed Circuit Boards
### Aliases: PLACE
### Keywords: datasets

### ** Examples

data(PLACE)

plot(PLACE[,-1])

boxplot(xDev ~ crcBrd, data=PLACE, 
        ylab="xDev", xlab="crcBrd")

PLACE$code <- factor(c(rep("lDev", 9*16),
                     rep("mDev", 3*16),
                     rep("hDev", 14*16)))
                     
plot(PLACE[,"xDev"], PLACE[,"yDev"],
     pch=as.integer(PLACE[,"code"]),
     main="", xlab="xDev", ylab="yDev")
     
grid()




