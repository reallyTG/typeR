library(ConnMatTools)


### Name: r.marked.egg.fraction
### Title: Estimates of fraction of eggs marked accounting for variability
###   in reproductive output
### Aliases: r.marked.egg.fraction

### ** Examples

library(ConnMatTools)

n.females <- 500
n.marked.females <- 100
p.marked.females <- n.marked.females/n.females
mn <- 1
cv <- 1
# Numbers of males and marked males and variance in male sperm production
# assumed the same as values for females

# Random values from distribution of pure female mark transmission
F=r.marked.egg.fraction(1000,n.females=n.females,n.marked.females=n.marked.females,
                        mean.female=mn,cv.female=cv)

# Random values from distribution of dual female-male mark transmission, but
# fraction of marked eggs only depends on fraction of marked males
Fm=r.marked.egg.fraction(1000,n.females=n.females,n.marked.females=n.marked.females,
                        mean.female=mn,cv.female=cv,dual=TRUE,male.uncert=FALSE)

# Random values from distribution of dual female-male mark transmission, with
# fraction of marked eggs depending on absolute marked and unmarked sperm output
FM=r.marked.egg.fraction(1000,n.females=n.females,n.marked.females=n.marked.females,
                         mean.female=mn,cv.female=cv,dual=TRUE,male.uncert=TRUE)

# Plot of pure female mark transmission
hist(F$p,50,main="Female mark transmission",
     xlab="Fraction of marked eggs",
     ylab="Frequency")

# Female+male mark transmission, but no variability in male mark transmission
h <- hist(Fm$p,50,main="Female+male mark transmission, no male uncert.",
          xlab="Fraction of marked eggs",
          ylab="Frequency")
hh <- hist((1-p.marked.females)*F$p + p.marked.females,
           breaks=c(-Inf,h$breaks,Inf),plot=FALSE)
lines(hh$mids,hh$counts,col="red")

# Plot of pure female mark transmission
h <- hist(FM$p,50,plot=FALSE)
hh <- hist(Fm$p,
           breaks=c(-Inf,h$breaks,Inf),plot=FALSE)
plot(h,ylim=c(0,1.1*max(hh$counts,h$counts)),
     main="Female+Male mark transmission, male uncert.",
     xlab="Fraction of marked eggs",
     ylab="Frequency")
lines(hh$mids,hh$counts,col="red")



