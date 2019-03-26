library(FSAdata)


### Name: Pallid
### Title: Lengths and weights for Pallid Sturgeon from four locations in
###   the Missouri River.
### Aliases: Pallid
### Keywords: datasets

### ** Examples

data(Pallid)
str(Pallid)
head(Pallid)
op <- par(mfrow=c(2,2),pch=19)
## four (of many possible) examples
plot(w~tl,data=Pallid,subset=loc=="NB",main="Nebraska")
plot(w~tl,data=Pallid,subset=loc=="SD",main="South Dakota")
plot(w~tl,data=Pallid,subset=loc=="ND",main="North Dakota")
plot(w~tl,data=Pallid,subset=loc=="MT",main="Montana")
par(op)




