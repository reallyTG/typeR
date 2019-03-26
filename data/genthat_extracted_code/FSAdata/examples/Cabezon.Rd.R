library(FSAdata)


### Name: Cabezon
### Title: Ages, lengths, and maturity for female Cabezon from Oregon.
### Aliases: Cabezon
### Keywords: datasets

### ** Examples

data(Cabezon)
str(Cabezon)
head(Cabezon)
op <- par(mfrow=c(2,2),pch=19)
plot(length~age,data=Cabezon,ylab="Total Length (cm)",xlab="Age")
hist(Cabezon$length,xlab="Total Length (cm)",main="")
tbl1 <- xtabs(~age+maturity,data=Cabezon)
(ptbl1 <- prop.table(tbl1,margin=1))
plot(ptbl1[,2]~as.numeric(row.names(ptbl1)),type="l",xlab="Age",ylab="Proportion Mature")
tbl2 <- xtabs(~length+maturity,data=Cabezon)
(ptbl2 <- prop.table(tbl2,margin=1))
plot(ptbl2[,2]~as.numeric(row.names(ptbl2)),type="l",xlab="Length",ylab="Proportion Mature")
par(op)




