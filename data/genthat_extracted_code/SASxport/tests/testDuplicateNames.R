library(SASxport)
Sys.setenv("TZ"="GMT")

## Read example dataset from a local file
testFile <- system.file('extdata', 'test2.xpt', package="SASxport")
w <- read.xport(testFile, names.tolower=TRUE)

# Duplicate df names
write.xport("AA"=w$test,"Aa"=w$test,"aA"=w$test,"aa"=w$test, file="dn.a.xpt") #1.a
read.xport("dn.a.xpt")

# Duplicate column names
a = w$test
b = w$test
colnames(b) <- tolower(colnames(b))
write.xport("combined"=cbind(a, b), file="dn.b.xpt")
read.xport("dn.b.xpt")
