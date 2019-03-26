library(matlib)


### Name: therapy
### Title: Therapy Data
### Aliases: therapy
### Keywords: datasets

### ** Examples

data(therapy)
plot(therapy ~ perstest, data=therapy, pch=16)
abline(lm(therapy ~ perstest, data=therapy), col="red")

plot(therapy ~ perstest, data=therapy, cex=1.5, pch=16, 
	col=ifelse(sex=="M", "red","blue"))



