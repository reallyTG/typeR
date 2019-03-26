library(OSDR)


### Name: OSDR
### Title: Finds an Optimal System of Distinct Representatives from a
###   family of subsets.
### Aliases: OSDR
### Keywords: ~order optimal matching ~incomplete matching

### ** Examples

### example 1
# M is the list of suitable applicants for five jobs
M1 <- c("A" , "B")
M2 <- c("B" , "C")
M3 <- c("B")
M4 <- c("A" , "C")
M5 <- c("B" , "C" , "D")
M  <- list(M1 , M2 , M3 , M4 , M5)

OSDR(M)

# $OSDR
# [1] "A" "C" "B" "0" "D"
# $matched
# [1] 1 2 3 5
# $unmatched
# [1] 4

# job 4 unmatched so Hall's condition is not satisfied: it's impossible to fill all the jobs
# note that there are (order-\emph{suboptimal}) assignments of the same length of the optimal: 
# eg: 0CBAD , BC0AD

#### example 2: sligthly modified: more than one order optimal matching
M1<-c("A","B","C")
M2<-c("A","C")
M3<-c("B")
M4<-c("A","C")
M5<-c("A","D")
M  <-list(M1,M2,M3,M4,M5)

OSDR(M)

# note there are other order optimal matchings: ACB0D or CAB0D 
# note there are also other maximum size matchings (not order optimal):
# e.g. 0CBAD or BC0AD

#### Case Study: matching men and women executives
# load executive data  
data(exdata)

# descriptives on:
# sex(0=M; 1=F) ;
# position (4=top manager, 3=medium/first line manager, 2 =supervisor);
table(exdata$sex)# there are more women
table(exdata$position,exdata$sex)# and more in apical position

# order by matching priority (high-rank women first)
# see e.g. Lynn and Thompson(1997), J. of Appl. Psych. 82(3))
data <- exdata[order(-exdata$sex,-exdata$position, -exdata$seniority),] 

# covariate distance matrix
require(optmatch)
dist <- match_on(sex ~ position+education+year_born+contract+part_fulltime+seniority ,
data=exdata) 
# use broad caliper to avoid very bad matches
dist <- caliper(dist,4,values=TRUE)

# minimum distance pair matching (package optmatch)
copt <- pairmatch(dist,data=exdata)
summary(copt)
sum(matched.distances(copt,dist)) # total cost 19

### find osdr
#order dist by priority order (i.e by decreasing position)
dist <- as.matrix(dist)[order(match(rownames(dist),rownames(exdata))),]
mylist <- matlist(dist)
res <- OSDR(mylist)

# index and labels of treated and untreated in OSDR
ord_dist<-as.matrix(dist)[order(match(names(mylist),rownames(exdata))),]
index_t<-res$matching; names_t<-rownames(ord_dist)[index_t]
index_ut<-res$unmatched;names_ut<-rownames(ord_dist)[index_ut]

# compare matched treated: optmatch vs ordmatch 
 #matched treated optmatch
   matched(copt)[which(exdata$sex==1)]     
 #matched treated ordmatch
   rownames(data)[which(exdata$sex==1)] %in% names_t
   
   
 # compare total matching cost: optmatch vs ordmatch
 
 # case 1: distance matrix is zero infinity: same cost (0)
 # case 2: distance matrix is not zero infinity
 #         find minimum cost matching on osdr:

    data2<-exdata[-match(names_ut,rownames(exdata)),]
    dist2<-as.matrix(dist)[-match(names_ut,rownames(dist)),]
    copt2 <- pairmatch(dist2,data=data2)
    summary(copt2);copt2
    sum(matched.distances(copt2,dist2)) # 22
    sum(matched.distances(copt,dist)) # 19





