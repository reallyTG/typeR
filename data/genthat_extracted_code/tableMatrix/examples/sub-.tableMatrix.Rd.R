library(tableMatrix)


### Name: [.tableMatrix
### Title: Bracket
### Aliases: [.tableMatrix [<-.tableMatrix

### ** Examples


data(images8By8)

# Create tableMatrix from images8By8
TM <- tableMatrix(images8By8, 1:3, 4:ncol(images8By8))


TM[2,1] <- "aaa"

TM[1,"dimX"] <- 1000

# setting row
TM[2,] <- list("aaa", 1000, 1000)

# setting column
TM[,2] <- 1




