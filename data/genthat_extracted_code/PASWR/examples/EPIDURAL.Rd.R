library(PASWR)


### Name: EPIDURAL
### Title: Traditional Sitting Position Versus Hamstring Stretch Position
### Aliases: EPIDURAL
### Keywords: datasets

### ** Examples

EPIDURAL$Teasy <-  factor(EPIDURAL$Ease, 
levels=c("Easy","Difficult","Impossible"))
X <- table(EPIDURAL$Doctor, EPIDURAL$Teasy)
X
par(mfrow=c(2,2)) # Figure 2.12
barplot(X,
main="Barplot where Doctor is Stacked \n within Levels of Palpitation")
barplot(t(X),
main="Barplot where Levels of Palpitation \n is Stacked within Doctor")
barplot(X, beside=TRUE,
main="Barplot where Doctor is Grouped \n within Levels of Palpitation")
barplot(t(X), beside=TRUE,
main="Barplot where Levels of Palpitation \n is Grouped within Doctor")
par(mfrow=c(1,1))
rm(X)



