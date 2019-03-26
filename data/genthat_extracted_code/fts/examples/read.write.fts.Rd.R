library(fts)


### Name: read.write.fts
### Title: Read / Write Files
### Aliases: read.write.fts read.csv.fts write.csv.fts
### Keywords: ts

### ** Examples

x <- fts(index=seq(from=Sys.Date(),by="days",length.out=100),data=1:100)
colnames(x) <- "big.ass.black.dog"

csv.fname <- paste(tempfile(),".csv",sep="")
write.csv.fts(x,csv.fname)
y.csv <- read.csv.fts(csv.fname)

all.equal(x,y.csv)



