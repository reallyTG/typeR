library(grr)


### Name: order2
### Title: Ordering vectors
### Aliases: order2

### ** Examples

chars<-as.character(sample(1e3,1e4,TRUE))
system.time(a<-order(chars))
system.time(b<-order2(chars))
identical(chars[a],chars[b])

ints<-as.integer(sample(1e3,1e4,TRUE))
system.time(a<-order(ints))
system.time(b<-order2(ints))
identical(ints[a],ints[b])

nums<-runif(1e4)
system.time(a<-order(nums))
system.time(b<-order2(nums))
identical(nums[a],nums[b])

logs<-as.logical(sample(0:1,1e6,TRUE))
system.time(a<-order(logs))
system.time(b<-order2(logs))
identical(logs[a],logs[b])

facts<-as.factor(as.character(sample(1e3,1e4,TRUE)))
system.time(a<-order(facts))
system.time(b<-order2(facts))
identical(facts[a],facts[b])

#How are special values like NA and Inf handled?
#For numerics, values sort intuitively, with the important note that NA and
#NaN will come after all real numbers but before Inf.
(function (x) x[order2(x)])(c(1,2,NA,NaN,Inf,-Inf))
#For characters, values sort correctly with NA at the end.
(function (x) x[order2(x)])(c('C','B',NA,'A'))
#For factors, values sort correctly with NA at the end.
(function (x) x[order2(x)])(as.factor(c('C','B',NA,'A')))


#Ordering a data frame using order2
df<-data.frame(one=as.character(1:4e5),
   two=sample(1:1e5,4e5,TRUE),
   three=sample(letters,4e5,TRUE),stringsAsFactors=FALSE)
system.time(a<-df[order(df$one),])  
system.time(b<-df[order2(df$one),])
system.time(a<-df[order(df$two),])  
system.time(b<-df[order2(df$two),])

## Not run: 
##D chars<-as.character(sample(1e5,1e6,TRUE))
##D system.time(a<-order(chars))
##D system.time(b<-order2(chars)) 
##D 
##D ints<-as.integer(sample(1e5,1e6,TRUE))
##D system.time(result<-order(ints))
##D system.time(result<-order2(ints))
##D 
##D nums<-runif(1e6)
##D system.time(result<-order(nums))
##D system.time(result<-order2(nums)) 
##D 
##D logs<-as.logical(sample(0:1,1e7,TRUE))
##D system.time(result<-order(logs))
##D system.time(result<-order2(logs))
##D 
##D facts<-as.factor(as.character(sample(1e5,1e6,TRUE)))
##D system.time(a<-order(facts))
##D system.time(b<-order2(facts))
##D identical(facts[a],facts[b])
##D 
##D 
## End(Not run)



