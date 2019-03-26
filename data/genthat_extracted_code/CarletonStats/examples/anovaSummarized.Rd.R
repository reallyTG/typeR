library(CarletonStats)


### Name: anovaSummarized
### Title: Anova F test
### Aliases: anovaSummarized
### Keywords: ANOVA Summarized data

### ** Examples


#use the data set chickwts from base R
head(chickwts)

N <- table(chickwts$feed)
stdev <- tapply(chickwts$weight, chickwts$feed, sd)
mn <- tapply(chickwts$weight, chickwts$feed, mean)

anovaSummarized(N, mn, stdev)




