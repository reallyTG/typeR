library(psy)


### Name: fpca
### Title: Focused Principal Components Analysis
### Aliases: fpca
### Keywords: multivariate

### ** Examples

data(sleep)
fpca(Paradoxical.sleep~Body.weight+Brain.weight+Slow.wave.sleep+Maximum.life.span+Gestation.time+Predation+Sleep.exposure+Danger,data=sleep)
fpca(y="Paradoxical.sleep",x=c("Body.weight","Brain.weight","Slow.wave.sleep","Maximum.life.span","Gestation.time","Predation","Sleep.exposure","Danger"),data=sleep)


## focused PCA of the duration of paradoxical sleep (dreams, 5th column)
## against constitutional variables in mammals (columns 2, 3, 4, 7, 8, 9, 10, 11).
## Variables inside the red cercle are significantly correlated
## to the dependent variable with p<0.05.
## Green variables are positively correlated to the dependent variable,
## yellow variables are negatively correlated.
## There are three clear clusters of independent variables.

corsleep <- as.data.frame(cor(sleep[,2:11],use="pairwise.complete.obs"))
fpca(Paradoxical.sleep~Body.weight+Brain.weight+Slow.wave.sleep+Maximum.life.span+Gestation.time+Predation+Sleep.exposure+Danger,
data=corsleep,input="Cor",sample.size=60)

## when missing data are numerous, the representation of a pairwise correlation
## matrix may be preferred (even if mathematical properties are not so good...)

numer <- c(2:4,7:11)
l <- length(numer)
resu <- vector(length=l)
for(i in 1:l)
{
int <- sleep[,numer[i]]
mod <- lm(sleep$Paradoxical.sleep~int)
resu[i] <-  summary(mod)[[4]][2,4]*sign(summary(mod)[[4]][2,1])
}
fpca(Paradoxical.sleep~Body.weight+Brain.weight+Slow.wave.sleep+Maximum.life.span+Gestation.time+Predation+Sleep.exposure+Danger,
data=sleep,pvalues=resu)
## A representation with p values
## When input="Cor" or pvalues="Yes" partial is turned to "No"

mod <- lm(sleep$Paradoxical.sleep~sleep$Body.weight+sleep$Brain.weight+
sleep$Slow.wave.sleep+sleep$Maximum.life.span+sleep$Gestation.time+
sleep$Predation+sleep$Sleep.exposure+sleep$Danger)
resu <-  summary(mod)[[4]][2:9,4]*sign(summary(mod)[[4]][2:9,1])
fpca(Paradoxical.sleep~Body.weight+Brain.weight+Slow.wave.sleep+Maximum.life.span+Gestation.time+Predation+Sleep.exposure+Danger,
data=sleep,pvalues=resu)
## A representation with p values which come from a multiple linear model
## (here results are difficult to interpret)



