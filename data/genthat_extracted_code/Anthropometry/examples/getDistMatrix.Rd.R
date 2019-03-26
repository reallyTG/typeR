library(Anthropometry)


### Name: getDistMatrix
### Title: Dissimilarity matrix between individuals and prototypes
### Aliases: getDistMatrix
### Keywords: array

### ** Examples

#Data loading:
dataTrimowa <- sampleSpanishSurvey
bust <- dataTrimowa$bust
#First bust class:
data <- dataTrimowa[(bust >= 74) & (bust < 78), ]   
numVar <- dim(dataTrimowa)[2]

#Weights calculation:
orness <- 0.7
weightsTrimowa <- weightsMixtureUB(orness,numVar)

#Constants required to specify the distance function:
numClust <- 3
bh <- (apply(as.matrix(log(data)),2,range)[2,] 
       - apply(as.matrix(log(data)),2,range)[1,]) / ((numClust-1) * 8) 
bl <- -3 * bh
ah <- c(23,28,20,25,25)
al <- 3 * ah

#Data processing.
num.persons <- dim(data)[1]
num.variables <- dim(data)[2]
datam <- as.matrix(data)
datat <- aperm(datam, c(2,1))                     
dim(datat) <- c(1,num.persons * num.variables)   

#Dissimilarity matrix:
D <- getDistMatrix(datat, num.persons, numVar, weightsTrimowa, bl, bh, al, ah, FALSE)



