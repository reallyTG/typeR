library(TRAMPR)


### Name: summary.TRAMP
### Title: Create Presence/Absence Matrices from TRAMP Objects
### Aliases: summary.TRAMP
### Keywords: methods

### ** Examples

data(demo.knowns)
data(demo.samples)
res <- TRAMP(demo.samples, demo.knowns)

head(summary(res))
head(summary(res, name=TRUE))
head(summary(res, name=TRUE, grouped=TRUE))

## Extract the species richness for each sample (i.e. the number of
## knowns present in each sample)
rowSums(summary(res, grouped=TRUE))

## Extract species frequencies and plot a rank abundance diagram:
## (i.e. the number of times each known was recorded)
sp.freq <- colSums(summary(res, name=TRUE, grouped=TRUE))

sp.freq <- sort(sp.freq[sp.freq > 0], decreasing=TRUE)
plot(sp.freq, xlab="Species rank", ylab="Species frequency", log="y")
text(1:2, sp.freq[1:2], names(sp.freq[1:2]), cex=.7, pos=4, font=3)



