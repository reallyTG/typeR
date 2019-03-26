library(FSAdata)


### Name: Lizardfish
### Title: Stock and recruitment data for Greater Lizardfish, 1955-1964.
### Aliases: Lizardfish
### Keywords: datasets

### ** Examples

data(Lizardfish)
str(Lizardfish)
head(Lizardfish)
op <- par(mfrow=c(1,2))
plot(recruits~year,data=Lizardfish,type="l")
plot(recruits~stock,data=Lizardfish)
par(op)




