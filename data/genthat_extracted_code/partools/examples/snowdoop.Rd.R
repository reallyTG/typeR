library(partools)


### Name: snowdoop,filechunkname, etc...
### Title: Snowdoop.
### Aliases: snowdoop filechunkname filesort filesplit filesplitrand
###   fileshuffle filecat readnscramble linecount getnumdigs filesave
###   fileread fileagg dfileagg filegetrows dfilegetrows

### ** Examples

cls <- makeCluster(2)
setclsinfo(cls)

# example of filesplit()
# make test input file
m <- rbind(1:2,3:4,5:6) 
write.table(m,"m",row.names=FALSE,col.names=FALSE) 
# apply the function
filesplit(2,"m",seqnums=TRUE)
# file m.1 and m.2 created, with contents c(1,1,2) and
# rbind(c(2,3,4),c(3,5,6)), respectively
# check it
read.table("m.1",header=FALSE,row.names=1)
read.table("m.2",header=FALSE,row.names=1)
m

# example of filecat(); assumes filesplit() example above already done
# delete file m so we can make sure we are re-creating it
unlink("m")
filecat(cls,"m")
# check that file m is back
read.table("m",row.names=1)

# example of filesave(), fileread()
# make test distributed data frame
clusterEvalQ(cls,x <- data.frame(u = runif(5),v = runif(5)))
# apply filesave()
filesave(cls,'x','xfile',1,' ')
# check it
fileread(cls,'xfile','xx',1,header=TRUE,sep=' ')
clusterEvalQ(cls,xx)
clusterEvalQ(cls,x)


# example of filesort()
# make test distributed input file
m1 <- matrix(c(5,12,13,3,4,5,8,8,8,1,2,3,6,5,4),byrow=TRUE,ncol=3)
m2 <- matrix(c(0,22,88,44,5,5,2,6,10,7,7,7),byrow=TRUE,ncol=3)
write.table(m1,"m.1",row.names=FALSE)
write.table(m2,"m.2",row.names=FALSE)
# sort on column 2 and check result
filesort(cls,"m",2,"msort",infiledst=TRUE,ndigs=1,nsamp=3,header=TRUE)
clusterEvalQ(cls,msort)  # data should be sorted on V2
# check by comparing to input
m1
m2
m <- rbind(m1,m2)
write.table(m,"m",row.names=FALSE)
clusterEvalQ(cls,rm(msort))
filesort(cls,"m",2,"msort",infiledst=FALSE,nsamp=3,header=TRUE)
clusterEvalQ(cls,msort)  # data should be sorted on V2

# example of readnscramble()
co2 <- head(CO2,25) 
write.table(co2,"co2",row.names=FALSE)  # creates file 'co2'
filesplit(2,"co2",header=TRUE)  # creates files 'co2.1', 'co2.2'
readnscramble(cls,"co2",header=TRUE)  # now have distrib. d.f.
# save the scrambled version to disk
filesave(cls,'co2','co2s',1,sep=',')

# example of fileshuffle()
# make test file, 'test'
cat('a','bc','def','i','j','k',file='test',sep='\n')
filesplit(2,'test')  # creates files 'test.1','test.2'
fileshuffle('test',2,'testa')  # creates shuffled files 'testa.1','testa.2'

# example of filechunkname()
clusterEvalQ(cls,filechunkname("x",3))  # returns "x.001", "x.002"

# example of getnumdigs()
getnumdigs(156)  # should be 3

# examples of filesave() and fileread()
mtc <- mtcars
distribsplit(cls,"mtc")
# save distributed data frame to distributed file
filesave(cls,'mtc','ctm',1,',') 
# read it back in to a new distributed data frame
fileread(cls,'ctm','ctmnew',1,header=TRUE,sep=',') 
# check it
clusterEvalQ(cls,ctmnew) 
# try dfileagg() on it (not same as distribagg())
dfileagg(cls,c('ctm.1','ctm.2'),c("mpg","disp","hp"),c("cyl","gear"),header=TRUE,sep=",","max")
# check
aggregate(cbind(mpg,disp,hp) ~ cyl+gear,data=mtcars,FUN=max)
# extract the records with 4 cylinders and 4 gears (again, different
# from distribgetrows())
cmd <- 'tmpdata[tmpdata$cyl == 4 & tmpdata$gear == 4,]'
dfilegetrows(cls,c('ctm.1','ctm.2'),cmd,header=TRUE,sep=',') 
# check
mtc[mtc$cyl == 4 & mtc$gear == 4,]

stopCluster(cls)





