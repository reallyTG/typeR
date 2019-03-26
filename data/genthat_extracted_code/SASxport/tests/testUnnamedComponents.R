library(SASxport)
Sys.setenv("TZ"="GMT")

##tests
example(read.xport)
## Read example dataset from a local file
testFile <- system.file('extdata', 'test2.xpt', package="SASxport")
w <- read.xport(testFile, names.tolower=TRUE)

write.xport(w$test,file="a.xpt") #1.a
lookup.xport("a.xpt")            #1.b
(tmp <- read.xport("a.xpt"))     #1.c

b <- w$test
write.xport(b,file="a.xpt")      #2.a
lookup.xport("a.xpt")            #2.b
(tmp <- read.xport("a.xpt"))     #2.c

write.xport(test=w$test,file="a.xpt") #3.a
lookup.xport("a.xpt")                 #3.b
(tmp <- read.xport("a.xpt"))          #3.c

write.xport(test=w$test,z=w$z,file="a.xpt") #4.a
lookup.xport("a.xpt")                       #4.b
(tmp <- read.xport("a.xpt"))                #4.c

write.xport(w$test,w$z,file="a.xpt") #5.a
lookup.xport("a.xpt")                #5.b
(tmp <- read.xport("a.xpt"))         #5.c

write.xport(w$test,z=w$z,file="a.xpt") #6.a
lookup.xport("a.xpt")                  #6.b
(tmp <- read.xport("a.xpt"))           #6.c

write.xport(list=w,file="a.xpt") #7.a
lookup.xport("a.xpt")            #7.b
(tmp <- read.xport("a.xpt"))     #7.c

names(w) <- NULL
write.xport(w[[1]],w[[2]],file="a.xpt") #8.a
lookup.xport("a.xpt")                   #8.b
(tmp <- read.xport("a.xpt"))            #8.c

names(w) <- NULL
write.xport(list=w,file="a.xpt") #9.a
lookup.xport("a.xpt")            #9.b
(tmp <- read.xport("a.xpt"))     #9.c

### Check that we catch invalid parameters
failure <- try( write.xport(5,"a.xpt") )             #10.a
stopifnot( "try-error" %in% class(failure) ) #10.b
(tmp <- read.xport("a.xpt"))                         #10.c

failure <- try( write.xport(list(a=5,b=6),"a.xpt") ) #11.a
stopifnot( "try-error" %in% class(failure) ) #11.b
(tmp <- read.xport("a.xpt"))                         #10.c

# Check with different list construction function *name*
w <- read.xport(testFile, names.tolower=TRUE)
write.xport(list=base::list(w$test,w$z),file="a.xpt")   #11.a
lookup.xport("a.xpt")                                   #11.b
(tmp <- read.xport("a.xpt"))                            #11.c

# remove names
w <- read.xport(testFile, names.tolower=TRUE)
names(w) <- NULL
w[[3]] <- NULL
write.xport(list=w,file="a.xpt") #12.a
lookup.xport("a.xpt")            #12.b
(tmp <- read.xport("a.xpt"))     #12.c

# remove variable names
w <- read.xport(testFile, names.tolower=TRUE)
colnames(w[[2]]) <- rep("", length=ncol(w[[2]]))
write.xport(list=w,file="a.xpt") #13.a
lookup.xport("a.xpt")            #13.b
(tmp <- read.xport("a.xpt"))     #13.c
