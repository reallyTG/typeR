library(HadoopStreaming)


### Name: hsTableReader
### Title: Chunks input data into data frames
### Aliases: hsTableReader

### ** Examples

  ## This function is useful as a reader for Hadoop reduce scripts
  str <- "key1\t3.9\nkey1\t8.9\nkey1\t1.2\nkey1\t3.9\nkey1\t8.9\nkey1\t1.2\nkey2\t9.9\nkey2\t10.1\nkey3\t1.0\nkey3\t3.4\nkey4\t9.4\n"
  cat(str)
  cols = list(key='',val=0)
  con <- textConnection(str, open = "r")
  hsTableReader(con,cols,chunkSize=6,FUN=print,ignoreKey=TRUE)
  close(con)
  con <- textConnection(str, open = "r")
  hsTableReader(con,cols,chunkSize=6,FUN=print,ignoreKey=FALSE,singleKey=TRUE)
  close(con)
  con <- textConnection(str, open = "r")
  hsTableReader(con,cols,chunkSize=6,FUN=print,ignoreKey=FALSE,singleKey=FALSE)
  close(con)

  ## The next two examples compute the mean, by key, in 2 different ways
  reducerKeyAtOnce <-function(d) {
    key = d[1,'key']
    ave = mean(d[,'val'])
    cat(key,ave,'\n',sep='\t')
  }
  con <- textConnection(str, open = "r")
  hsTableReader(con,cols,chunkSize=6,FUN=reducerKeyAtOnce,ignoreKey=FALSE,singleKey=TRUE)
  close(con)

  
  reducerManyCompleteKeys <-function(d) {
    a=aggregate(d$val,by=list(d$key),FUN=mean)
    write.table(a,quote=FALSE,sep='\t',row.names=FALSE,col.names=FALSE)
  }

  con <- textConnection(str, open = "r")
  hsTableReader(con,cols,chunkSize=6,FUN=reducerManyCompleteKeys,ignoreKey=FALSE,singleKey=FALSE)
  close(con)

### ADVANCED: When we have more values for each key  than can fit in memory
  ## Test example to see how the input is broken up
  reducerFullKeys <- function(d) {
    print("Processing complete keys.")
    print(d)
  }
  reducerPartialKey <- function(d) {
    if (nrow(d)==0) {
      print("Done with partial key")
    } else {
      print("Processing partial key...")
      print(d)
    }
  }
  con <- textConnection(str, open = "r")
  hsTableReader(con,cols,chunkSize=5,FUN=reducerFullKeys,ignoreKey=FALSE,singleKey=FALSE,PFUN=reducerPartialKey)
  close(con)

  ## Repeats the mean example, with partial key processing
  partialSum = 0
  partialCnt = 0
  partialKey = NA
  reducerPartialKey <- function(d) {
    if (nrow(d)==0) {
      ## empty data.frame indicates that we have seen all rows for the previous key
      ave = partialSum / partialCnt
      cat(partialKey,ave,'\n',sep='\t')
      partialSum <<- 0
      partialCnt <<- 0
      partialKey <<- NA
    } else {
      if (is.na(partialKey)) partialKey <<- d[1,'key']
      partialSum <<- partialSum + sum(d[,'val'])
      partialCnt <<- partialCnt + nrow(d)
    }
  }
  con <- textConnection(str, open = "r")
  hsTableReader(con,cols,chunkSize=6,FUN=reducerKeyAtOnce,ignoreKey=FALSE,singleKey=TRUE,PFUN=reducerPartialKey)
  close(con)
  con <- textConnection(str, open = "r")
  hsTableReader(con,cols,chunkSize=6,FUN=reducerManyCompleteKeys,ignoreKey=FALSE,singleKey=FALSE,PFUN=reducerPartialKey)
  close(con)



