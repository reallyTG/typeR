library(DySeq)


### Name: NumbOccur
### Title: NumbOccur
### Aliases: NumbOccur

### ** Examples

# Example 1: Small artificial example

# Creating data, if sequence ends, rest should be 'NA'
seq1<-c(1,0,0,0,1,0,1, NA, NA, NA) # 3 out of 7 Entrys should be round about .43
seq2<-c(1,1,1,1, NA, NA, NA, NA, NA, NA) # 4 out of 4 should be 1
seq3<-c(1,0,0,0,1,1, NA, NA, NA, NA) # 3 out of 6 should be .50
my.data<-rbind(seq1,seq2,seq3)

# Determine the proportion of ones in my.data
NumbOccur(my.data,1)
NumbOccur(my.data,1, prop=FALSE) # compute absolute frequencies


# Example 2: Real data dyadic sequences
# A researcher is interested in how often was a certain behavior
# shown till another one stopped completely

my.last<-LastOccur(CouplesCope[,2:49],1) # how long till stress ended?
NumbOccur(CouplesCope[,50:97],1, my.last) # how often did dyadic coping occure in this time?




