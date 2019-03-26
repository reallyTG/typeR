library(MultiJoin)


### Name: ArtificialData
### Title: create artificial data for testing
### Aliases: ArtificialData

### ** Examples



if (0){


  ArtificialData("fakeData2",verbose=1)


  ArtificialData("fakeData2",joinKey = 1:2000, N = rep(1500,4) ,verbose=0)


  


  ret = ArtificialData(fakeDataDir="/tmp/fakeData")


  ret = ArtificialData(fakeDataDir="./fakeData", joinKey=letters[1:10], numFiles = 6, N = rep(5,6))


  ret = ArtificialData(SORT = 1, GZIP = 1)





  ret = ArtificialData(fakeDataDir="fakeData", joinKey = 0:9, N = rep(6, 4), verbose=1)


  #on allegro:


  ret = ArtificialData(fakeDataDir="./fakeData", joinKey=letters, numFiles = 10, 


                       N = rep(18,10), NCOL=rep(5,10))


}





