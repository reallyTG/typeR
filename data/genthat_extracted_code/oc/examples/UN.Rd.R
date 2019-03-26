library(oc)


### Name: UN
### Title: United Nations Vote Data
### Aliases: UN
### Keywords: datasets

### ** Examples

#The same data set can be obtained from downloading the UN.csv
#file from legacy.voteview.com and reading it as follows:
## Not run: 
##D UN<-read.csv("UN.csv",header=FALSE,strip.white=TRUE)
## End(Not run)

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

# Not Run
## Not run: 
##D result<-oc(rc,polarity=1,dims=1)
##D plot(result)
##D summary(result)
## End(Not run)




