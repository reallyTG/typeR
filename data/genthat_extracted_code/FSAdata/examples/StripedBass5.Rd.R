library(FSAdata)


### Name: StripedBass5
### Title: Ages of Striped Bass assigned from otoliths by two readers.
### Aliases: StripedBass5
### Keywords: datasets

### ** Examples

data(StripedBass5)
str(StripedBass5)
head(StripedBass5)
plot(reader2~reader1,data=StripedBass5)
xtabs(~reader1+reader2,data=StripedBass5)




