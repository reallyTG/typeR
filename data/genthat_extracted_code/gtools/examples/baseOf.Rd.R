library(gtools)


### Name: baseOf
### Title: Transform an integer to an array of base-n digits
### Aliases: baseOf
### Keywords: base

### ** Examples

# decimal representation
baseOf(123)

# dual representation
baseOf(123,base=2)

# octal representation
baseOf(123,base=8)

# hexadecimal representation
baseOf(123,base=16)

# hexadecimal with more typical letter-notation
c(0:9,LETTERS)[baseOf(123,16)]

# hexadecimal again, now showing a single string
paste(c(0:9,LETTERS)[baseOf(123,16)],collapse="")

# decimal representation but filling leading zeroes
baseOf(123,len=5)

# and converting that back
sum(2^(4:0)*baseOf(123,len=5))

# hashing and a tabular venn diagram derived from it
m<-matrix(sample(c(FALSE,TRUE),replace=TRUE,size=300),ncol=4)
colnames(m)<-c("strong","colorful","nice","humorous")
names(dimnames(m)) <- c("samples","features")
head(m)

m.val <- apply(m,1,function(X){return(sum(2^((ncol(m)-1):0)*X))})
m.val.rle <- rle(sort(m.val))
m.counts <- cbind(baseOf(m.val.rle$value,base=2,len=ncol(m)),
                    m.val.rle$lengths)
colnames(m.counts)<- c(colnames(m),"num")
rownames(m.counts)<- apply(m.counts[,1:ncol(m)],1,paste,collapse="")
m.counts[1==m.counts[,"nice"]&1==m.counts[,"humorous"],,drop=FALSE]
m.counts[,"num",drop=TRUE]



