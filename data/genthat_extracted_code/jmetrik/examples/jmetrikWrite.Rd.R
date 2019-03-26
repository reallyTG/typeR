library(jmetrik)


### Name: jmetrikWrite
### Title: Writes a file in *.jmetrik format.
### Aliases: jmetrikWrite

### ** Examples

## No test: 

#Create some data
id<-100+seq(1:10)
x<-sample(c("A", "B", "C", "D"), 10, replace=TRUE)
y<-sample(c("A", "B", "C", "D"), 10, replace=TRUE)
z<-sample(c(0,1,2,3), 10, replace=TRUE)
sc<-rnorm(10)
exdata<-as.data.frame(cbind(id, x, y, z, sc))
names(exdata)<-c("id", "item1", "item2", "item3", "score")

#A is the correct answer
aOK<- "(A,B,C,D)(1,0,0,0)"

#B is the correct answer
bOK<-"(A,B,C,D)(0,1,0,0)"

#polytomous item scoring
poly<-"(0,1,2,3)(0,1,2,3)"

#Special data codes e.g. missing and not reached responses
#These can be unique to each item or the same. Here they
#are the same.
datCodes<-"(NA,OM,NR)(0,0,0)"

#Create scoring, special data codes, and labels
scoring<-c("", aOK, bOK, poly, "")
codes<-c("", rep(datCodes, 3), "")
labels<-c("ID variable", "Test item 1", "Test item 2", "Test item 3", "Test score")

#write the file
jmetrikWrite(x=exdata, 
             fileName=file.path(tempdir(), "test-write.jmetrik"),
             codes=codes, 
             scoring=scoring, 
             labels=labels)
            
## End(No test)




