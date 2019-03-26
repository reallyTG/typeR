library(Dasst)


### Name: [[<-
### Title: "[[<-" method for class 'Dasst'
### Aliases: [[<- [[<-,Dasst,numeric-method

### ** Examples

# Add a row of NA at the end of the table 1
data(plantGrowth)
rmax <- nrow(plantGrowth[[1]])
plantGrowth[[1]][rmax + 1, ] <- NA

# Edit a subset
plantGrowth[[1]][131:132,2:4]
plantGrowth[[1]][131:132,2:4] <- matrix(rep(100,6),nrow=2)
plantGrowth[[1]][131:132,2:4]

# Remove the last rows
# No need to subset left hand side. Dimension are automatically adjusted.
tail(plantGrowth[[1]])
plantGrowth[[1]] <- plantGrowth[[1]][c(-131,-132), ]
tail(plantGrowth[[1]])

# Column names are also valid
plantGrowth[[1]][129:130,"SNW1C"]
plantGrowth[[1]][129:130,"SNW1C"] <- 1100:1101
plantGrowth[[1]][129:130,"SNW1C"]



