library(MCPAN)


### Name: binomRDci
### Title: Simultaneous confidence intervals for contrasts of independent
###   binomial proportions (in a oneway layout)
### Aliases: binomRDci binomRDci.default binomRDci.table binomRDci.matrix
###   binomRDci.formula
### Keywords: htest

### ** Examples


###############################################################

### Example 1 Tables 1,7,8 in Schaarschmidt et al. (2008):  ###

###############################################################

# Number of patients under observation: 
n <- c(29, 24, 25, 24, 46)

# Number of patients with complete response:
cr <- c(7, 11, 10, 12, 21)

# (Optional) names for the treatments
dn <- c("0.3_1.0", "3", "10", "30", "90")

# Assume we aim to infer an increasing trend with increasing dosage,
# Using the changepoint contrasts (Table 7, Schaarschmidt et al., 2008)

# The results in Table 8 can be reproduced by calling:

binomRDci(n=n, x=cr, names=dn, alternative="greater",
 method="ADD2", type="Changepoint")

binomRDci(n=n, x=cr, names=dn, alternative="greater",
 method="ADD1", type="Changepoint")

binomRDci(n=n, x=cr, names=dn, alternative="greater", 
 method="Wald", type="Changepoint")

##############################################################

### Example 2, Tables 2,9,10 in Schaarschmidt et al. 2008  ###

##############################################################

# Data (Table 2)

# animals under risk
n<-c(30,30,30,30)

# animals showing cancer
cancer<-c(20,14,27,19)

# short names for the treatments
trtn<-c("HFaFi","LFaFi","HFaNFi","LFaNFi")


# User-defined contrast matrix (Table 9),
# columns of the contrast matrix 

cmat<-rbind(
"Fiber - No Fiber"=c( 0.5, 0.5,-0.5,-0.5),
"Low Fat - High Fat"=c(-0.5, 0.5,-0.5, 0.5),
"Interaction Fat:Fiber"=c(   1,  -1,   -1,  1))

cmat

# The results in Table 10 can be reproduced by calling:

# simultaneous CI using the add-2 adjustment

sci<-binomRDci(x=cancer, n=n, names=trtn, method="ADD2",
 cmat=cmat, dist="MVN")

sci

# marginal CI using the basic Wald formula

ci<-binomRDci(x=cancer, n=n, names=trtn, method="Wald",
 cmat=cmat, dist="N")

ci


# check, whether the intended contrasts have been defined:

summary(sci)

# plot the result:

plot(sci, lines=0, lineslty=3)


##########################################


# In simple cases, counts of successes
# and number of trials can be just typed:

ntrials <- c(40,20,20,20)
xsuccesses <- c(1,2,2,4)
names(xsuccesses) <- LETTERS[1:4]
ex1D<-binomRDci(x=xsuccesses, n=ntrials, method="ADD1",
 type="Dunnett")
ex1D

ex1W<-binomRDci(x=xsuccesses, n=ntrials, method="ADD1",
 type="Williams", alternative="greater")
ex1W

# results can be plotted:
plot(ex1D, main="Comparisons to control group A", lines=0, linescol="red", lineslwd=2)

# summary gives a more detailed print out:
summary(ex1W)

# if data are represented as dichotomous variable
# in a data.frame one can make use of table:


#################################

data(liarozole)

head(liarozole)

binomRDci(Improved ~ Treatment, data=liarozole,
 type="Tukey")

# here, it might be important to define which level of the
# variable 'Improved' is to be considered as success

binomRDci(Improved ~ Treatment, data=liarozole,
 type="Dunnett", success="y", base=4)

# If data are available as a named kx2-contigency table:

tab<-table(liarozole)
tab

# Comparison to the control group "Placebo",
# which is the fourth group in alpha-numeric order:

CIs<-binomRDci(tab, type="Dunnett", success="y", base=4)

plot(CIs, lines=0)




