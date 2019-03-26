library(FSAdata)


### Name: PikeWindermere
### Title: Stock and recruitment data for Northern Pike from Lake
###   Windermere, 1944-1981.
### Aliases: PikeWindermere
### Keywords: datasets

### ** Examples

data(PikeWindermere)
str(PikeWindermere)
head(PikeWindermere)
op <- par(mfrow=c(2,2),pch=19)
plot(recruits~year,data=PikeWindermere,subset=basin=="North",main="North")
plot(recruits~stock,data=PikeWindermere,subset=basin=="North",main="North")
plot(recruits~year,data=PikeWindermere,subset=basin=="South",main="South")
plot(recruits~stock,data=PikeWindermere,subset=basin=="South",main="South")
par(op)





