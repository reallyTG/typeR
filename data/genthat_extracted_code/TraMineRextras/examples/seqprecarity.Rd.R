library(TraMineRextras)


### Name: seqprecarity
### Title: Precarity index
### Aliases: seqprecarity seqprecorr
### Keywords: Sequence analysis

### ** Examples

## Defining a sequence object with columns 13 to 24
## in the 'actcal' example data set
data(actcal)
actcal <- actcal[1:200,] ## Here, only a subset
actcal.seq <- seqdef(actcal[,13:24])

## precarity using the original state order
prec <- seqprecarity(actcal.seq)
ici <- seqici(actcal.seq) ## complexity

seqn <- seqformat(actcal.seq, to="SPS", compress=TRUE)
tab <- data.frame(seqn,ici,prec)
names(tab) <- c("seq","ici","prec")
head(tab)

## Assuming A and B as equivalent regarding precarity
prec2 <- seqprecarity(actcal.seq, state.equiv=list(c('A','B')))
tab <- cbind(tab,prec2)
names(tab)[ncol(tab)] <- "prec2"

## and letting C be non-comparable
prec3 <- seqprecarity(actcal.seq, state.order=c("A","B","D"),
  state.equiv=list(c('A','B')))
tab <- cbind(tab,prec3)
names(tab)[ncol(tab)] <- "prec3"
head(tab)

## Extracting the q(x) used for the correction factor (1-q(x))
q <- seqprecorr(actcal.seq, state.order=c("A","B","D"),
  state.equiv=list(c('A','B')))
## correction factor
corr.f <- 1 + q
## number of non neutral correction factors
length(corr.f[corr.f != 1])

## Precarity with rank-based transition weights
prec.rank <- seqprecarity(actcal.seq, method='RANK')



