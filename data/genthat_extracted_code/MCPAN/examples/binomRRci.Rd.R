library(MCPAN)


### Name: binomRRci
### Title: Simultaneous confidence intervals for ratios of independent
###   binomial proportions
### Aliases: binomRRci binomRRci.default binomRRci.table binomRRci.matrix
###   binomRRci.formula
### Keywords: htest

### ** Examples


# In simple cases, counts of successes
# and number of trials can be just typed:

ntrials <- c(40,20,20,20)
xsuccesses <- c(1,2,2,4)
names(xsuccesses) <- LETTERS[1:4]
ex1D<-binomRRci(x=xsuccesses, n=ntrials,
 type="Dunnett")
ex1D

ex1W<-binomRRci(x=xsuccesses, n=ntrials,
 type="Williams", alternative="greater")
ex1W

# results can be plotted:
plot(ex1D, main="Comparisons to control group A")

# summary gives a more detailed print out:
summary(ex1W)

# if data are represented as dichotomous variable
# in a data.frame one can make use of table:


data(liarozole)

head(liarozole)

# here, it might be important to define which level of the
# variable 'Improved' is to be considered as success

binomRRci(Improved ~ Treatment, data=liarozole,
 type="Dunnett", success="y", base=4, alternative="greater")

# If data are available as a named kx2-contigency table:

tab<-table(liarozole)
tab

binomRRci(tab, type="Dunnett", success="y", base=4, alternative="greater")


# Performance for extreme cases:


binomRRci(x=c(0,0,20,5),n=c(20,20,20,20),names=c("A","B","C","D"),
 type="Dunnett", alternative="greater")





