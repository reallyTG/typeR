library(CTT)


### Name: reliability
### Title: Function for item reliability analysis
### Aliases: reliability
### Keywords: misc

### ** Examples


# Scored input (data frame is preferred)
 x<-data.frame(matrix(c(0,0,0,0,0,
                        0,0,0,0,0,
                        0,0,0,0,1,
                        0,0,0,1,1,
                        0,0,1,1,1,
                        0,1,1,1,1,
                        1,1,1,1,1,
                        1,0,1,1,1,
                        0,0,0,1,1,
                        0,1,1,1,1),nrow=10,ncol=5,byrow=TRUE,
                        dimnames=list(c(paste("P",c(1:10),sep="")),c(paste("I",c(1:5),sep="")))))
reliability(x, itemal=TRUE)

# To see more item statisitics
str(reliability(x,itemal=TRUE))



