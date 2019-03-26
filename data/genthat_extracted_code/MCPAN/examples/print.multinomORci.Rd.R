library(MCPAN)


### Name: print.multinomORci
### Title: Print out put of multinomORci
### Aliases: print.multinomORci as.data.frame.multinomORci
### Keywords: misc

### ** Examples


# fakle data: 3 categories (A,B,C) in 4 tretament groups c(co,d1,d2,d3)
dm <- rbind(
"co" = c(15,5,5),
"d1" = c(10,10,5),
"d2" = c(5,10,10),
"d3" = c(5,5, 15))
colnames(dm)<- c("A","B","C")

dm

#  define and name odds between categories
cmodds <- rbind(
"B/A"=c(-1,1,0),
"C/A"=c(-1,0,1))

#  define and name comparsions between groups
cmtrt <- rbind(
"d1/co"=c(-1,1,0,0),
"d2/co"=c(-1,0,1,0),
"d3/co"=c(-1,0,1,0))

TEST <- multinomORci(Ymat=dm, cmcat=cmodds, cmgroup=cmtrt, cimethod="DP", BSIM=1000, prior=1)
TEST
print(TEST, exp=FALSE)
as.data.frame(TEST)




