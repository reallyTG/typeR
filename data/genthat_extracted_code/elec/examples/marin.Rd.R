library(elec)


### Name: marin
### Title: Marin Measure B Reported Results
### Aliases: marin
### Keywords: datasets

### ** Examples

data(marin)
marin = elec.data( marin, C.names=c("Yes","No") )

# Hand fixing error bound due to unknown
# vote totals in the VBM decks
marin$V$e.max = maximumMarginBound(marin)
sum( marin$V$e.max )   # 7.128
vbm = marin$V$strata=="ST-VBM"
marin$V[ vbm, "e.max" ] = 2 * marin$V[ vbm, "tot.votes" ] / marin$margin

sum( marin$V$e.max )   # 9.782




