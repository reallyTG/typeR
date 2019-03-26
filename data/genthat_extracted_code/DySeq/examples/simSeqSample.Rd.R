library(DySeq)


### Name: simSeqSample
### Title: simSeqSample
### Aliases: simSeqSample

### ** Examples


test1<-matrix(c(0.5 , 0.2 , 0.2 , 0.1,
                0.8 , 0.05, 0.05, 0.1,
                0.5 , 0.1 , 0.2 , 0.2,
                0.1 , 0.1 , 0.1 , 0.7) , 4 , 4 , byrow = TRUE)

initial<-c(.25 , .25 , .25 , .25)

simSeq(test1, initial, 30)




