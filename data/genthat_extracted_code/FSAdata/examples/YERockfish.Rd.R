library(FSAdata)


### Name: YERockfish
### Title: Ages, lengths, and maturity for Yelloweye Rockfish.
### Aliases: YERockfish
### Keywords: datasets

### ** Examples

data(YERockfish)
str(YERockfish)
head(YERockfish)
op <- par(mfrow=c(2,2),pch=19)
plot(length~age,data=YERockfish,ylab="Total Length (cm)",xlab="Age")
hist(YERockfish$length,xlab="Total Length (cm)",main="")
tbl1 <- with(YERockfish,table(age,maturity))
(ptbl1 <- prop.table(tbl1,margin=1))
plot(ptbl1[,2]~as.numeric(row.names(ptbl1)),type="l",xlab="Age",ylab="Proportion Mature")
tbl2 <- with(YERockfish,table(length,maturity))
(ptbl2 <- prop.table(tbl2,margin=1))
plot(ptbl2[,2]~as.numeric(row.names(ptbl2)),type="l",xlab="Age",ylab="Proportion Mature")
par(op)




