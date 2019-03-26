library(polysat)


### Name: read.STRand
### Title: Read Genotypes Produced by STRand Software
### Aliases: read.STRand
### Keywords: file

### ** Examples

# generate file to read
strtemp <- data.frame(Pop=c("P1","P1","P2","P2"),
                      Ind=c("a","b","a","b"),
                      LocD=c("0","172/174","170/172/178*","172/176"),
                      LocG=c("130/136/138/142*","132/136","138","132/140/144*"))
write.table(strtemp, file="strtemp.txt", sep="\t",
            row.names=FALSE, quote=FALSE)

# read the file
mydata <- read.STRand("strtemp.txt")
viewGenotypes(mydata)
PopNames(mydata)

# alternative example with popInSam=FALSE
strtemp$Ind <- c("OH1","OH5","MT4","MT7")
write.table(strtemp, file="strtemp.txt", sep="\t",
            row.names=FALSE, quote=FALSE)
mydata <- read.STRand("strtemp.txt", popInSam=FALSE)
Samples(mydata)
PopNames(mydata)



