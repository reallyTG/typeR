library(wnominate)


### Name: UN
### Title: United Nations Vote Data
### Aliases: UN
### Keywords: datasets

### ** Examples

#The same data set can be obtained from downloading the UN.csv
#file from www.voteview.com and reading it as follows:
#UN<-read.csv("C:/UN.csv",header=FALSE,strip.white=TRUE)

data(UN)
UN<-as.matrix(UN)
UN[1:5,1:6]

UNnames<-UN[,1]
legData<-matrix(UN[,2],length(UN[,2]),1)
colnames(legData)<-"party"
UN<-UN[,-c(1,2)]

rc <- rollcall(UN, yea=c(1,2,3), nay=c(4,5,6),
missing=c(7,8,9),notInLegis=0, legis.names=UNnames,
legis.data=legData,
desc="UN Votes",
source="www.voteview.com")

# Not run
#result<-wnominate(rc,polarity=c(1,1))
#plot(result)
#summary(result)



