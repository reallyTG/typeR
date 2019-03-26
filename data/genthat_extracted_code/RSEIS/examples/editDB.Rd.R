library(RSEIS)


### Name: editDB
### Title: Edit Data Base
### Aliases: editDB pathDB
### Keywords: misc

### ** Examples


## Not run: 
##D 
##D DB <- makeDB('/media/disk-1/TUNG_2010', "2010",
##D kind=2,Iendian=1, BIGLONG=FALSE )
##D 
##D sw <- which(DB$yr>2011)
##D 
##D ##########   remove the bad lines from the DB
##D DDB <- editDB(DB, -sw)
##D infoDB(DB)
##D 
##D #############  to change the path names if the data
##D ##   moves to a different server:
##D 
##D ###for example: 
##D ###  
##D 
##D path1<-"/data/wadati/soju"
##D path2<-"/mnt"
##D 
##D newDB <- pathDB(DB, path1, path2 )
##D 
## End(Not run)





