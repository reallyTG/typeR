library(emuR)


### Name: classplot
### Title: Produce a classification plot from discriminant or SVM modelling
### Aliases: classplot

### ** Examples


library(MASS)
# Data from female speaker 68
temp = vowlax.spkr=="68"
# Quadratic discriminant analysis
fm.qda = qda(vowlax.fdat.5[temp,1:2], vowlax.l[temp])
# Linear discriminant analysis
fm.lda = lda(vowlax.fdat.5[temp,1:2], vowlax.l[temp])

xlim=c(0,1000)
ylim=c(0,3000)

par(mfrow=c(1,2))
classplot(fm.qda, xlim=xlim, ylim=ylim, main="QDA")
classplot(fm.lda, xlim=xlim, ylim=ylim, main="LDA")


# install.packages("e1071")
# library(e1071)
# Support vector machine
## Not run: fm.svm = svm(vowlax.fdat.5[temp,1:2], factor(vowlax.l[temp]))
## Not run: xlim = range(vowlax.fdat.5[temp,1])
## Not run: ylim = range(vowlax.fdat.5[temp,2])
## Not run: classplot(fm.svm, xlim=xlim, ylim=ylim, xlab="F1", ylab="F2", main="SVM")          




