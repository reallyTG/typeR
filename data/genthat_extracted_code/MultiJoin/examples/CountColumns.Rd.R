library(MultiJoin)


### Name: CountColumns
### Title: count columns of files
### Aliases: CountColumns

### ** Examples



if (0){


  ret = ArtificialData(fakeDataDir="fakeData2", joinKey = 0:9, N = rep(6, 4), verbose=1)


  CountColumns(paste0("fakeData2/file",1:4,".txt"))


  #gzipped data:


  ret = ArtificialData(fakeDataDir="fakeData2", joinKey = 0:9, N = rep(6, 4), GZIP=1, verbose=1)


  CountColumns(paste0("fakeData2/file",1:4,".txt.gz"),mycat ="gunzip -cf ")


  #gzipped and selected columns:  


  ret = ArtificialData(fakeDataDir="fakeData2", joinKey = 0:9, N = rep(6, 4), GZIP=1, verbose=1)


  CountColumns(paste0("fakeData2/file",1:4,".txt.gz"),mycat ="gunzip -cf ", 


               filterStr=" | cut -f1,3 -d\" \" ")


}





