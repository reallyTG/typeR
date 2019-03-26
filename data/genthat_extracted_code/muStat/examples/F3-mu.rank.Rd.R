library(muStat)


### Name: mu.rank
### Title: Ranks of Data
### Aliases: mu.rank mu.rank.nna
### Keywords: nonparametric

### ** Examples

a <- c(4, 2, 5, 1, 4, NA, 6)
mu.rank(a) # default: na.last=TRUE, na.rm=FALSE
# [1] 3.5 2.0 5.0 1.0 3.5 7.0 6.0
mu.rank(a,na.last=NA) # default: na.rm=TRUE
# [1] 3.5 2.0 5.0 1.0 3.5     6.0
mu.rank(a,na.last=NA,na.rm=FALSE)
#     3.5 2.0 5.0 1.0 3.5  NA 6.0

# Spearman's rank correlation between two sets of testscores 
a <- c(4, 2, 5, 1, 4, NA, 6)
b <- c(4, 2, 5, NA, 4, 5, 6)

cor(a, b, if(is.R()) "complete.obs" else "available") 
# [1] 0.8241688
cor(a, b, if(is.R()) "pairwise.complete.obs" else "omit")
# [1] 1

cor(rank(a), rank(b))
# [1] 0.1651446
cor(mu.rank(a, na.last=NA, na.rm=FALSE),
    mu.rank(b, na.last=NA, na.rm=FALSE), 
    if(is.R()) "complete.obs" else "available")
# [1] 0.8523852 
cor(mu.rank(a, na.last=NA, na.rm=FALSE),
    mu.rank(b, na.last=NA, na.rm=FALSE), 
    if(is.R()) "pairwise.complete.obs" else "omit")
# [1] 0.9953452
cor(rank(a[!is.na(a*b)]), rank(b[!is.na(a*b)]))
# [1] 1



