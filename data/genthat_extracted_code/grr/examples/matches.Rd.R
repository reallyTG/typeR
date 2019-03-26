library(grr)


### Name: matches
### Title: Value Matching
### Aliases: matches

### ** Examples

one<-as.integer(1:10000)
two<-as.integer(sample(1:10000,1e3,TRUE))
system.time(a<-lapply(one, function (x) which(two %in% x)))
system.time(b<-matches(one,two,all.y=FALSE,list=TRUE))

#Only retain items from one with a match in two
b<-matches(one,two,all.x=FALSE,all.y=FALSE,list=TRUE)
length(b)==length(unique(two))

one<-round(runif(1e3),3)
two<-round(runif(1e3),3)
system.time(a<-lapply(one, function (x) which(two %in% x)))
system.time(b<-matches(one,two,all.y=FALSE,list=TRUE))
 
one<-as.character(1:1e5)
two<-as.character(sample(1:1e5,1e5,TRUE))
system.time(b<-matches(one,two,list=FALSE))
system.time(c<-merge(data.frame(key=one),data.frame(key=two),all=TRUE))

## Not run: 
##D one<-as.integer(1:1000000)
##D two<-as.integer(sample(1:1000000,1e5,TRUE))
##D system.time(b<-matches(one,two,indexes=FALSE))
##D if(requireNamespace("dplyr",quietly=TRUE))
##D  system.time(c<-dplyr::full_join(data.frame(key=one),data.frame(key=two)))
##D if(require(data.table,quietly=TRUE))
##D  system.time(d<-merge(data.table(data.frame(key=one))
##D              ,data.table(data.frame(key=two))
##D              ,by='key',all=TRUE,allow.cartesian=TRUE))
##D 
##D one<-as.character(1:1000000)
##D two<-as.character(sample(1:1000000,1e5,TRUE))
##D system.time(a<-merge(one,two)) #Times out
##D system.time(b<-matches(one,two,indexes=FALSE))
##D if(requireNamespace("dplyr",quietly=TRUE))
##D  system.time(c<-dplyr::full_join(data.frame(key=one),data.frame(key=two)))#'
##D if(require(data.table,quietly=TRUE))
##D {
##D  system.time(d<-merge(data.table(data.frame(key=one))
##D              ,data.table(data.frame(key=two))
##D              ,by='key',all=TRUE,allow.cartesian=TRUE))
##D  identical(b[,1],as.character(d$key))
##D }
## End(Not run)



