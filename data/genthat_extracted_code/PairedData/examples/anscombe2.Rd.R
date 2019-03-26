library(PairedData)


### Name: anscombe2
### Title: Teaching the paired t test
### Aliases: anscombe2
### Keywords: datasets

### ** Examples

data(anscombe2)
# p=0.05 for the paired t-test
with(anscombe2,plot(paired(X1,Y1),type="BA"))
with(anscombe2,t.test(paired(X1,Y1)))

# Same p but Var(X2)<Var(Y2) and
# correlation in the Bland-Altman plot
with(anscombe2,t.test(paired(X2,Y2)))
with(anscombe2,summary(paired(X2,Y2)))
with(anscombe2,plot(paired(X2,Y2),type="BA"))

# Same p but two clusters
with(anscombe2,plot(paired(X3,Y3),type="BA"))

# Same p but the difference is "linked" to the mean
with(anscombe2,plot(paired(X4,Y4),type="BA"))



