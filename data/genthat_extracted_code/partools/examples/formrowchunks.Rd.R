library(partools)


### Name: formrowchunks,addlists,matrixtolist,setclsinfo,getpte,distribsplit,distribcat,distribagg,distribrange,distribcounts,distribgetrows,docmd,doclscmd,geteltis,distribmeans,distribisdt,ipstrcat,dwhich.min,dwhich.max
### Title: Utilities for 'parallel' cluster code.
### Aliases: formrowchunks matrixtolist addlists setclsinfo getpte
###   exportlibpaths distribsplit distribcat distribagg distribrange
###   distribcounts distribgetrows distribmeans dwhich.min dwhich.max docmd
###   doclscmd distribisdt geteltis ipstrcat

### ** Examples

# examples of addlists()
l1 <- list(a=2, b=5, c=1)
l2 <- list(a=8, c=12, d=28)
addlists(l1,l2,sum)  # list with a=10, b=5, c=13, d=28
z1 <- list(x = c(5,12,13), y = c(3,4,5))
z2 <- list(y = c(8,88))
addlists(z1,z2,c)  # list with x=(5,12,13), y=(3,4,5,8,88)

# need 'parallel' cluster for the remaining examples
cls <- makeCluster(2)
setclsinfo(cls)

# check it
clusterEvalQ(cls,partoolsenv$myid)  # returns 1, 2
clusterEvalQ(cls,partoolsenv$ncls)  # returns 2, 2

# formrowchunks example; see up a matrix to be distributed first
m <- rbind(1:2,3:4,5:6)
# apply the function
formrowchunks(cls,m,"mc")
# check results
clusterEvalQ(cls,mc)  # list of a 1x2 and a 2x2 matrix

matrixtolist(1,m)  # 3-component list, first is (1,2)

# test of of distribagg(): 
# form and distribute test data
x <- sample(1:3,10,replace=TRUE)
y <- sample(0:1,10,replace=TRUE)
u <- runif(10)
v <- runif(10)
d <- data.frame(x,y,u,v)
distribsplit(cls,"d")
# check that it's there at the cluster nodes, in distributed form
clusterEvalQ(cls,d) 
d
# try the aggregation function
distribagg(cls,c("u","v"), c("x","y"),"d","max")
# check result
aggregate(cbind(u,v) ~ x+y,d,max)

# real data
mtc <- mtcars
distribsplit(cls,"mtc")

distribagg(cls,c("mpg","disp","hp"),c("cyl","gear"),"mtc","max")
# check
aggregate(cbind(mpg,disp,hp) ~ cyl+gear,data=mtcars,FUN=max)

distribcounts(cls,c("cyl","gear"),"mtc")
# check
table(mtc$cyl,mtc$gear)

# find mean mpg, hp for each cyl/gear combination
distribmeans(cls,c('mpg','hp'),c('cyl','gear'),'mtc')

# extract and collect all the mtc rows in which the number of cylinders is 8
distribgetrows(cls,'mtc[mtc$cyl == 8,]')
# check
mtc[mtc$cyl == 8,]

# same for data.tables
mtc <- as.data.table(mtc)
setkey(mtc,cyl)
distribsplit(cls,'mtc')
distribcounts(cls,c("cyl","gear"),"mtc")
distribmeans(cls,c('mpg','hp'),c('cyl','gear'),'mtc')

dwhich.min(cls,'mtc$mpg')  # smallest is at node 1, row 15
dwhich.max(cls,'mtc$mpg')  # largest is at node 2, row 4

stopCluster(cls)




