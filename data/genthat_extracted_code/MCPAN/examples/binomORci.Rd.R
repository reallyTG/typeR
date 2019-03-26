library(MCPAN)


### Name: binomORci
### Title: Simultaneous confidence intervals for odds ratios
### Aliases: binomORci binomORci.default binomORci.formula binomORci.table
###   binomORci.matrix
### Keywords: htest

### ** Examples

data(liarozole)

table(liarozole)

# Comparison to the control group "Placebo",
# which is the fourth group in alpha-numeric
# order:

ORlia<-binomORci(Improved ~ Treatment,
 data=liarozole, success="y", type="Dunnett", base=4)
ORlia
summary(ORlia)
plot(ORlia)

# if data are available as table:

tab<-table(liarozole)
tab
ORlia2<-binomORci(tab, success="y", type="Dunnett", base=4)
ORlia2

plot(ORlia2, lines=1, lineslty=3)


############################

#  Performance for extreme cases

# method="GLM" (the default)

test1<-binomORci(x=c(0,1,5,20), n=c(20,20,20,20), names=c("A","B","C","D"))
test1
plot(test1)

# adjusted Woolf interval

test2<-binomORci(x=c(0,1,5,20), n=c(20,20,20,20), names=c("A","B","C","D"), method="Woolf")
test2
plot(test2)




