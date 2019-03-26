library(heplots)


### Name: Adopted
### Title: Adopted Children
### Aliases: Adopted
### Keywords: datasets

### ** Examples

# Treat as multivariate regression problem
Adopted.mod <- lm(cbind(Age2IQ, Age4IQ, Age8IQ, Age13IQ) ~ AMED + BMIQ, data=Adopted)
Adopted.mod

require(car)
# test overall multivariate regression
linearHypothesis(Adopted.mod, c("AMED","BMIQ"))

# show separate linear regressions
op <- par(mfcol=c(2,4), mar=c(4,4,2,2)+.1)
for (i in 3:6) {
	dataEllipse(as.matrix(Adopted[,c(1,i)]),col="black", levels=0.68, ylim=c(70,140))
	abline(lm(Adopted[,i] ~ Adopted[,1]), col="red", lwd=2)
	dataEllipse(as.matrix(Adopted[,c(2,i)]),col="black", levels=0.68, ylim=c(70,140))
	abline(lm(Adopted[,i] ~ Adopted[,2]), col="red", lwd=2)
	abline(a=0,b=1, lty=1, col="blue")
}
par(op)

# between-S (MMReg) plots
heplot(Adopted.mod, hypotheses=list("Reg"=c("AMED", "BMIQ")),
	main="IQ scores of adopted children: MMReg")

pairs(Adopted.mod, hypotheses=list("Reg"=c("AMED", "BMIQ")))

heplot3d(Adopted.mod, hypotheses=list("Reg"=c("AMED", "BMIQ")),
	col = c("red", "blue", "black", "gray"), wire=FALSE)

# Treat IQ at different ages as a repeated measure factor
# within-S models & plots
Age <- data.frame(Age=ordered(c(2,4,8,13)))
Anova(Adopted.mod, idata=Age, idesign=~Age, test="Roy")

# within-S plots
heplot(Adopted.mod, idata=Age, idesign=~Age, iterm="Age",
	cex=1.25, cex.lab=1.4, fill=c(FALSE, TRUE),
	hypotheses=list("Reg"=c("AMED", "BMIQ"))
	)




