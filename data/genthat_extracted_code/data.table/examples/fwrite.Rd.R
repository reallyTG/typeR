library(data.table)


### Name: fwrite
### Title: Fast CSV writer
### Aliases: fwrite
### Keywords: data

### ** Examples


DF = data.frame(A=1:3, B=c("foo","A,Name","baz"))
fwrite(DF)
write.csv(DF, row.names=FALSE, quote=FALSE)  # same

fwrite(DF, row.names=TRUE, quote=TRUE)
write.csv(DF)                                # same

DF = data.frame(A=c(2.1,-1.234e-307,pi), B=c("foo","A,Name","bar"))
fwrite(DF, quote='auto')        # Just DF[2,2] is auto quoted
write.csv(DF, row.names=FALSE)  # same numeric formatting

DT = data.table(A=c(2,5.6,-3),B=list(1:3,c("foo","A,Name","bar"),round(pi*1:3,2)))
fwrite(DT)
fwrite(DT, sep="|", sep2=c("{",",","}"))

## Not run: 
##D 
##D set.seed(1)
##D DT = as.data.table( lapply(1:10, sample,
##D          x=as.numeric(1:5e7), size=5e6))                            #     382MB
##D system.time(fwrite(DT, "/dev/shm/tmp1.csv"))                        #      0.8s
##D system.time(write.csv(DT, "/dev/shm/tmp2.csv",                      #     60.6s
##D                       quote=FALSE, row.names=FALSE))
##D system("diff /dev/shm/tmp1.csv /dev/shm/tmp2.csv")                  # identical
##D 
##D set.seed(1)
##D N = 1e7
##D DT = data.table(
##D   str1=sample(sprintf("%010d",sample(N,1e5,replace=TRUE)), N, replace=TRUE),
##D   str2=sample(sprintf("%09d",sample(N,1e5,replace=TRUE)), N, replace=TRUE),
##D   str3=sample(sapply(sample(2:30, 100, TRUE), function(n)
##D      paste0(sample(LETTERS, n, TRUE), collapse="")), N, TRUE),
##D   str4=sprintf("%05d",sample(sample(1e5,50),N,TRUE)),
##D   num1=sample(round(rnorm(1e6,mean=6.5,sd=15),2), N, replace=TRUE),
##D   num2=sample(round(rnorm(1e6,mean=6.5,sd=15),10), N, replace=TRUE),
##D   str5=sample(c("Y","N"),N,TRUE),
##D   str6=sample(c("M","F"),N,TRUE),
##D   int1=sample(ceiling(rexp(1e6)), N, replace=TRUE),
##D   int2=sample(N,N,replace=TRUE)-N/2
##D )                                                                   #     774MB
##D system.time(fwrite(DT,"/dev/shm/tmp1.csv"))                         #      1.1s
##D system.time(write.csv(DT,"/dev/shm/tmp2.csv",                       #     63.2s
##D                       row.names=FALSE, quote=FALSE))
##D system("diff /dev/shm/tmp1.csv /dev/shm/tmp2.csv")                  # identical
##D 
##D unlink("/dev/shm/tmp1.csv")
##D unlink("/dev/shm/tmp2.csv")
## End(Not run)




