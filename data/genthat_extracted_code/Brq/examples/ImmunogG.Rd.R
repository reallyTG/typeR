library(Brq)


### Name: ImmunogG
### Title: Immunoglobulin G Data
### Aliases: ImmunogG
### Keywords: ImmunogG

### ** Examples

data(ImmunogG)
attach(ImmunogG)
y=IgG
x=Age
X=cbind(x, x^2)
plot(Age,IgG)
plot(Age,IgG, main="Quantile Regression Fit", cex=.5, col="gray")
for (i in 1:5) {
if (i==1) p = .05
if (i==2) p = .25
if (i==3) p = .50
if (i==4) p = .75
if (i==5) p = .95
fit = Brq(y~X,tau=p,runs=400, burn=100)
# Note: runs =11000 and burn =1000
curve(fit$coef[1]+fit$coef[2]*x+fit$coef[3]*x^2,col=i,add=TRUE)
}





