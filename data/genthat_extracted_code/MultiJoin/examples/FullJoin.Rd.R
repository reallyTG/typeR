library(MultiJoin)


### Name: FullJoin
### Title: create command to fully join multiple (more than 2) files
### Aliases: FullJoin

### ** Examples



if (0){


  #no FIFOs:


  FullJoin(NumFields = rep(4,2))


  FullJoin(paste0("ftr",1:4,".txt"), NumFields = rep(4, 4), suffix = " | gzip > joined.txt.gz")


  FullJoin(paste0("ftr",1:4,".txt"), NumFields = rep(3, 4),missingValue="0", suffix = "")


  #with FIFOs:


  FullJoin(paste0("ftr",1:4,".txt"), mycat = "cat ", NumFields = rep(3, 4),missingValue="0", 


           suffix = "", verbose=2)


  FullJoin(paste0("ftr",1:3,".txt.gz"), mycat = "gunzip -cf ", filterStr = " | cut -f1,3", 


           NumFields = rep(2, 3), verbose=2)


  #selected columns only:


  FullJoin(paste0("ftr",1:3,".txt"), mycat = "cat ", filterStr = "cut -f1,3",  


           NumFields = rep(2, 3),missingValue="0", suffix = "", verbose=2)


  


  ret = ArtificialData(fakeDataDir="./fakeData2", joinKey=letters, numFiles = 10, 


                       N = rep(18,10), NCOL=rep(5,10))


  FullJoin(paste0("./fakeData2/file",1:10,".txt"),missingValue="0", suffix = "", verbose=2)


  


  # let's try FIFOs:


  #small:


  cmd = FullJoin(paste0("file",1:2,".txt"), mycat = "cat ", NumFields = rep(5, 2),


                 missingValue="0", suffix = " > joined.txt", verbose=2)


  


  cmd = FullJoin(paste0("file",1:3,".txt"), mycat = "cat ", NumFields = rep(5, 3),


                 missingValue="0", suffix = " > joined.txt", verbose=2)


  


  # and now gzipped files:


  ret = ArtificialData(fakeDataDir="./fakeData", joinKey=letters, numFiles = 10,GZIP =1, 


                       N = rep(18,10), NCOL=rep(5,10))


  cmd = FullJoin(paste0("./fakeData/file",1:10,".txt.gz"), mycat = "gunzip -c ",  


                 NumFields = rep(3, 10),missingValue="NA",


                 filterStr = " | cut -f1,2,3",


                 suffix = "  > joined.txt", verbose=2)


  


  x = FullJoin(paste0("./fakeData/file",1:10,".txt.gz"), mycat = "gunzip -c ",  


               NumFields = rep(3, 10),missingValue="NA",


               filterStr = " | cut -f1,2,3",ReturnData=TRUE,


               suffix = "", verbose=0)


}


#let us try a laarge example





#uids = sort(paste0(sample(LETTERS,10^7,replace=TRUE), sample(10^8,10^7)))


#uids = paste0(LETTERS, (10^7):(10^8))


#tmp=expand.grid(LETTERS,LETTERS,LETTERS,0:9,0:9);str(tmp)


#uids=apply(expand.grid(LETTERS[1:3],LETTERS[1:3],0:2,0:3),1,paste0,collapse="")


#uids=apply(expand.grid(LETTERS,LETTERS,LETTERS,0:9,0:9),1,paste0,collapse="")


if (0) {


  uids = scan("uids.txt",what="")


  Nfiles=100          


  ret = ArtificialData(fakeDataDir="./fakeData", joinKey=uids, 


                 numFiles = Nfiles, GZIP =1, N = rep(10^5,Nfiles), NCOL=rep(10,Nfiles))


  cmd = FullJoin(paste0("fakeData/file",1:10,".txt.gz"), mycat = "gunzip -c ",  


                 NumFields = rep(3, 10),missingValue="NA",


                 filterStr = " | cut -f1,2,3",


                 suffix = " | gzip > ./fakeData/joined.txt.gz", verbose=2)


  system("rm /tmp/fifo*")


  for (go in cmd) system(go)


  


  x = FullJoin(paste0("./fakeData/file",1:10,".txt.gz"), mycat = "gunzip -c ",  


               NumFields = rep(3, 10),missingValue="NA",


               filterStr = " | cut -f1,2,3",ReturnData=TRUE,


               suffix = "", prefix="", verbose=0)


}








