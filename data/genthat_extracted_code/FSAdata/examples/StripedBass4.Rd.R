library(FSAdata)


### Name: StripedBass4
### Title: Ages of Striped Bass assigned from scales by two readers.
### Aliases: StripedBass4
### Keywords: datasets

### ** Examples

data(StripedBass4)
str(StripedBass4)
head(StripedBass4)
plot(reader2~reader1,data=StripedBass4)
xtabs(~reader1+reader2,data=StripedBass4)




