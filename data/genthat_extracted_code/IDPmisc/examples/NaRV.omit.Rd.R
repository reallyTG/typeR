library(IDPmisc)


### Name: NaRV.omit
### Title: Omit Observations with NA, NaN, Inf and -Inf Values
### Aliases: NaRV.omit
### Keywords: manip

### ** Examples

M <- matrix(c(NA,1:7,NA),nrow=3)
M
NaRV.omit(M)

DF <- iris[sample(1:nrow(iris),12),]
DF[1,1] <- NA
DF[10,5] <- NA
row.names(DF) <- 1:12
DF
NaRV.omit(DF)

NaRV.omit(c(NA,1:10,NA))

fac <- factor(c(NA,sample(c(1:9))))
NaRV.omit(fac)

fac <- factor(c(NA,sample(c(1:9))),exclude=NULL)
fac
NaRV.omit(fac)



