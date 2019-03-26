library(mosaic)


### Name: resample
### Title: More Random Samples
### Aliases: resample deal shuffle sample sample.default sample.data.frame
###   sample.matrix sample.factor

### ** Examples

# 100 Bernoulli trials -- no need for replace=TRUE
resample(0:1, 100)
tally(resample(0:1, 100))
if (require(mosaicData)) {
Small <- sample(KidsFeet, 10)
resample(Small)
tally(~ sex, data=resample(Small))
tally(~ sex, data=resample(Small))
# fixed marginals for sex
tally(~ sex, data=Small)
tally(~ sex, data=resample(Small, groups=sex)) 
# shuffled can be used to reshuffle some variables within groups
# orig.id shows where the values were in original data frame.
Small <- mutate(Small, 
   id1 = paste(sex,1:10, sep=":"),  
   id2 = paste(sex,1:10, sep=":"))
resample(Small, groups=sex, shuffled=c("id1","id2"))
}
deal(Cards, 13)    # A Bridge hand
shuffle(Cards)



