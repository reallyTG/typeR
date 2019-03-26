library(InterVA5)


### Name: DataCheck5
### Title: Data cleaning for InterVA-5 algorithm
### Aliases: DataCheck5
### Keywords: InterVA

### ** Examples


data(RandomVA5)
data(probbaseV5)
probbaseV5 <- as.matrix(probbaseV5)
RandomVA5 <- as.matrix(RandomVA5)
input <- as.character(RandomVA5[1, ])
input[which(toupper(input) == "N")] <- "0" 
input[which(toupper(input) == "Y")] <- "1" 
input[which(input != "1" & input != "0")] <- NA
input <- as.numeric(input)
output <- DataCheck5(Input=input, id="d1", probbaseV5=probbaseV5, write=TRUE)





