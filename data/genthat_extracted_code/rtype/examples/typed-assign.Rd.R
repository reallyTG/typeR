library(rtype)


### Name: typed-assign
### Title: Assign with type checking
### Aliases: array<- atomic<- call<- character<- check<- complex<-
###   data.frame<- double<- envir<- expression<- factor<- fun<- integer<-
###   language<- list<- logical<- matrix<- name<- null<- numeric<- object<-
###   pairlist<- raw<- recursive<- symbol<- table<- typed-assign vector<-

### ** Examples

## Not run: 
##D x <- 10L
##D atomic(x) <- 20
##D numeric(x) <- 10
##D numeric(x, length = 10L) <- 1:10
##D 
##D cond1 <- function(x) mean(x) <= 5
##D numeric(x, cond1) <- 0:9
## End(Not run)



