library(FSA)


### Name: alkMeanVar
### Title: Mean Values-at-age from an age-length key
### Aliases: alkMeanVar
### Keywords: manip

### ** Examples

## Example -- Even breaks for length categories
WR1 <- WR79
# add length intervals (width=5)
WR1$LCat <- lencat(WR1$len,w=5)
# get number of fish in each length interval in the entire sample
len.n <- xtabs(~LCat,data=WR1)
# isolate aged sample
WR1.age <- subset(WR1, !is.na(age))
# create age-length key
raw <- xtabs(~LCat+age,data=WR1.age)
( WR1.key <- prop.table(raw, margin=1) )

## use age-length key to estimate mean length-at-age of all fish
# Bettoli-Miranda method
alkMeanVar(WR1.key,len~LCat+age,WR1.age,len.n)

# Quinn-Deriso method
alkMeanVar(WR1.key,len~LCat+age,WR1.age,len.n,method="QuinnDeriso")




