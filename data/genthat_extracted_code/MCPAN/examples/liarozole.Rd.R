library(MCPAN)


### Name: liarozole
### Title: Marked improvement of psoriasis after application of liarozole
### Aliases: liarozole
### Keywords: datasets

### ** Examples

data(liarozole)
head(liarozole)
# create a contingency table:

table(liarozole)


# the order of the groups is alpha-numeric,
# and "y" for success is of higher order than
# to change the order:

liarozole$Treatment<-factor(liarozole$Treatment,
 levels=c("Placebo", "Dose50", "Dose75", "Dose150"))

liarozole$Improved<-factor(liarozole$Improved,
 levels=c("y", "n"))


tab<-table(liarozole)
tab

# Approximate simultaneous confidence intervals
# for the differences  pDose-pPlacebo:

LCI<-binomRDci(tab, type="Dunnett", 
alternative="greater", method="ADD1")

LCI

plot(LCI, main="Proportion of patients
 with marked improvement")

# Perform a test on increasing trend 
# vs. the placebo group:

Ltest<-binomRDtest(tab, type="Williams", 
alternative="greater", method="ADD1")

summary(Ltest)




