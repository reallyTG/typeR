library(tableMatrix)


### Name: [.tableList
### Title: Bracket
### Aliases: [.tableList [<-.tableList

### ** Examples


data(images8By8)

# Create tableList from images8By8[,1:3]
TL <- tableList(images8By8[,1:3])

# Apply data.table bracket on a tableList object
TL[direction=="both"]


TL[2,1] <- "aaa"

# setting row
TL[2,] <- list("aaa", 1000, 1000)

# setting column
TL[,2] <- 1




