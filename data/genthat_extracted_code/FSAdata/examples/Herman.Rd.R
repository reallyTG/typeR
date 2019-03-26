library(FSAdata)


### Name: Herman
### Title: Lengths for Walleye, Yellow Perch, Black Crappie, and Black
###   Bullheads from Lake Herman, SD.
### Aliases: Herman
### Keywords: datasets

### ** Examples

data(Herman)
str(Herman)
head(Herman)
op <- par(mfrow=c(2,2),pch=19)
### Four (of 16 possible) examples
with(subset(Herman,spec=="bbh" & yr==2003),hist(tl,main="Black Bullhead, 2003"))
with(subset(Herman,spec=="bkc" & yr==2001),hist(tl,main="Black Crappie, 2001"))
with(subset(Herman,spec=="yep" & yr==2003),hist(tl,main="Yellow Perch, 2003"))
with(subset(Herman,spec=="wae" & yr==1999),hist(tl,main="Walleye, 1999"))
par(op)




