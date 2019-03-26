library(grr)


### Name: sort2
### Title: Sorting vectors
### Aliases: sort2

### ** Examples

chars<-as.character(sample(1e3,1e4,TRUE))
system.time(a<-sort(chars))
system.time(b<-sort2(chars))
identical(a,b)  
 
ints<-as.integer(sample(1e3,1e4,TRUE))
system.time(a<-sort(ints))
system.time(b<-sort2(ints))
identical(a,b)
 
nums<-runif(1e4)
system.time(a<-sort(nums))
system.time(b<-sort2(nums))
identical(a,b)

logs<-as.logical(sample(0:1,1e6,TRUE))
system.time(result<-sort(logs))
system.time(result<-sort2(logs))

facts<-as.factor(as.character(sample(1e3,1e4,TRUE)))
system.time(a<-sort(facts))
system.time(b<-sort2(facts))
identical(a,b)

#How are special values like NA and Inf handled?
#For numerics, values sort intuitively, with the important note that NA and
#NaN will come after all real numbers but before Inf.
sort2(c(1,2,NA,NaN,Inf,-Inf))
#For characters, values sort correctly with NA at the end.
sort2(c('C','B',NA,'A'))
#For factors, values sort correctly with NA at the end
sort2(as.factor(c('C','B',NA,'A')))

## Not run: 
##D chars<-as.character(sample(1e5,1e6,TRUE))
##D system.time(a<-sort(chars))
##D system.time(b<-sort2(chars))
##D 
##D ints<-as.integer(sample(1e5,1e6,TRUE))
##D system.time(result<-sort(ints))
##D system.time(result<-sort2(ints))
##D 
##D nums<-runif(1e6)
##D system.time(result<-sort(nums))
##D system.time(result<-sort2(nums))
##D 
##D logs<-as.logical(sample(0:1,1e7,TRUE))
##D system.time(result<-sort(logs))
##D system.time(result<-sort2(logs))
##D 
##D facts<-as.factor(as.character(sample(1e5,1e6,TRUE)))
##D system.time(a<-sort(facts))
##D system.time(b<-sort2(facts))
## End(Not run)



