library(FSA)


### Name: alkAgeDist
### Title: Proportions-at-age from an age-length key
### Aliases: alkAgeDist
### Keywords: manip

### ** Examples

## Example -- Even breaks for length categories
WR1 <- WR79
# add length intervals (width=5)
WR1$LCat <- lencat(WR1$len,w=5)
# get number of fish in each length interval in the entire sample
len.n <- xtabs(~LCat,data=WR1)
# isolate aged sample and get number in each length interval
WR1.age <- subset(WR1, !is.na(age))
lenA.n <- xtabs(~LCat,data=WR1.age)
# create age-length key
raw <- xtabs(~LCat+age,data=WR1.age)
( WR1.key <- prop.table(raw, margin=1) )

# use age-length key to estimate age distribution of all fish
alkAgeDist(WR1.key,lenA.n,len.n)




