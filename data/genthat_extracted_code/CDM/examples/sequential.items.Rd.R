library(CDM)


### Name: sequential.items
### Title: Constructing a Dataset with Sequential Pseudo Items for Ordered
###   Item Responses
### Aliases: sequential.items
### Keywords: Sequential item response model

### ** Examples

#############################################################################
# EXAMPLE 1: Constructing sequential pseudo items for data.mg
#############################################################################

data(data.mg, package="CDM")
dat <- data.mg
items <- colnames(dat)[ which( substring( colnames(dat),1,1)=="I" ) ]
##    [1] "I1"  "I2"  "I3"  "I4"  "I5"  "I6"  "I7"  "I8"  "I9"  "I10" "I11"
data <- dat[,items]

# construct sequential dichotomous pseudo items
res <- CDM::sequential.items(data)

# item information table
res$iteminfo
  ##      item itemindex category pseudoitem
  ##   1    I1         1        1         I1
  ##   2    I2         2        1         I2
  ##   3    I3         3        1         I3
  ##   4    I4         4        1    I4_Cat1
  ##   5    I4         4        2    I4_Cat2
  ##   6    I5         5        1    I5_Cat1
  ##   7    I5         5        2    I5_Cat2
  ##     [...]

# extract dataset with pseudo items
dat.expand <- res$dat.expand
colnames(dat.expand)
  ##    [1] "I1"       "I2"       "I3"       "I4_Cat1"  "I4_Cat2"  "I5_Cat1"
  ##    [7] "I5_Cat2"  "I6_Cat1"  "I6_Cat2"  "I7_Cat1"  "I7_Cat2"  "I7_Cat3"
  ##   [13] "I8"       "I9"       "I10"      "I11_Cat1" "I11_Cat2" "I11_Cat3"

# compare original items and pseudoitems

#**** Item I1
stats::xtabs( ~ paste(data$I1) + paste(dat.expand$I1) )
  ##                 paste(dat.expand$I1)
  ##   paste(data$I1)     0     1    NA
  ##               0   4339     0     0
  ##               1      0 33326     0
  ##               NA     0     0   578

#**** Item I7

stats::xtabs( ~ paste(data$I7) + paste(dat.expand$I7_Cat1) )
  ##                 paste(dat.expand$I7_Cat1)
  ##   paste(data$I7)     0     1    NA
  ##               0   3825     0     0
  ##               1      0 14241     0
  ##               2      0 14341     0
  ##               3      0  5169     0
  ##               NA     0     0   667

stats::xtabs( ~ paste(data$I7) + paste(dat.expand$I7_Cat2) )
  ##                 paste(dat.expand$I7_Cat2)
  ##   paste(data$I7)     0     1    NA
  ##               0      0     0  3825
  ##               1  14241     0     0
  ##               2      0 14341     0
  ##               3      0  5169     0
  ##               NA     0     0   667

stats::xtabs( ~ paste(data$I7) + paste(dat.expand$I7_Cat3) )
  ##                 paste(dat.expand$I7_Cat3)
  ##   paste(data$I7)     0     1    NA
  ##               0      0     0  3825
  ##               1      0     0 14241
  ##               2  14341     0     0
  ##               3      0  5169     0
  ##               NA     0     0   667

## Not run: 
##D #*** Model 1: Rasch model for sequentially created pseudo items
##D mod <- CDM::gdm( dat.expand, irtmodel="1PL", theta.k=seq(-5,5,len=21),
##D              skillspace="normal", decrease.increments=TRUE)
## End(Not run)



