library(memisc)


### Name: collect
### Title: Collect Objects
### Aliases: collect collect.default collect.array collect.matrix
###   collect.table collect.data.frame collect.data.set
### Keywords: utilities manip

### ** Examples

x <- c(a=1,b=2)
y <- c(a=10,c=30)

x
y

collect(x,y)
collect(x,y,inclusive=FALSE)

X <- matrix(1,nrow=2,ncol=2,dimnames=list(letters[1:2],LETTERS[1:2]))
Y <- matrix(2,nrow=3,ncol=2,dimnames=list(letters[1:3],LETTERS[1:2]))
Z <- matrix(3,nrow=2,ncol=3,dimnames=list(letters[1:2],LETTERS[1:3]))

X
Y
Z

collect(X,Y,Z)
collect(X,Y,Z,inclusive=FALSE)

X <- matrix(1,nrow=2,ncol=2,dimnames=list(a=letters[1:2],b=LETTERS[1:2]))
Y <- matrix(2,nrow=3,ncol=2,dimnames=list(a=letters[1:3],c=LETTERS[1:2]))
Z <- matrix(3,nrow=2,ncol=3,dimnames=list(a=letters[1:2],c=LETTERS[1:3]))

collect(X,Y,Z)
collect(X,Y,Z,inclusive=FALSE)

df1 <- data.frame(a=rep(1,5),b=rep(1,5))
df2 <- data.frame(a=rep(2,5),b=rep(2,5),c=rep(2,5))
collect(df1,df2)
collect(df1,df2,inclusive=FALSE)

data(UCBAdmissions)
Male <- as.table(UCBAdmissions[,1,])
Female <- as.table(UCBAdmissions[,2,])
collect(Male,Female,sourcename="Gender")
collect(unclass(Male),unclass(Female))

Male1 <- as.table(UCBAdmissions[,1,-1])
Female2 <- as.table(UCBAdmissions[,2,-2])
Female3 <- as.table(UCBAdmissions[,2,-3])
collect(Male=Male1,Female=Female2,sourcename="Gender")
collect(Male=Male1,Female=Female3,sourcename="Gender")
collect(Male=Male1,Female=Female3,sourcename="Gender",fill=NA)

f1 <- gl(3,5,labels=letters[1:3])
f2 <- gl(3,6,labels=letters[1:3])
collect(f1=table(f1),f2=table(f2))




