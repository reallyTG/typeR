library(sirt)


### Name: fit.isop
### Title: Fitting the ISOP and ADISOP Model for Frequency Tables
### Aliases: fit.isop fit.adisop
### Keywords: ISOP model ADISOP model

### ** Examples

#############################################################################
# EXAMPLE 1: Dataset Reading
#############################################################################

data(data.read)
dat <- as.matrix( data.read)
dat.resp <- 1 - is.na(dat) # response indicator matrix
I <- ncol(dat)

#***
# (1) Data preparation
#     actually only freq.correct and wgt are needed
#     but these matrices must be computed in advance.

# different scores of students
stud.p <- rowMeans( dat, na.rm=TRUE )
# different item p values
item.p <- colMeans( dat, na.rm=TRUE )
item.ps <- sort( item.p, index.return=TRUE)
dat <- dat[,  item.ps$ix ]
# define score groups students
scores <- sort( unique( stud.p ) )
SC <- length(scores)
# create table
freq.correct <- matrix( NA, SC, I )
wgt <- freq.correct
# percent correct
a1 <- stats::aggregate( dat==1, list( stud.p ), mean, na.rm=TRUE )
freq.correct <- a1[,-1]
# weights
a1 <- stats::aggregate( dat.resp, list( stud.p ), sum, na.rm=TRUE )
wgt <- a1[,-1]

#***
# (2) Fit ISOP model
res.isop <- sirt::fit.isop( freq.correct, wgt )
# fitted frequency table
res.isop$fX

#***
# (3) Fit ADISOP model
# use monotonely smoothed frequency table from ISOP model
res.adisop <- sirt::fit.adisop( freq.correct=res.isop$fX, wgt )
# fitted frequency table
res.adisop$fX



