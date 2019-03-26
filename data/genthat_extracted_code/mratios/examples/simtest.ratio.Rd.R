library(mratios)


### Name: simtest.ratio
### Title: Simultaneous tests for ratios of normal means
### Aliases: simtest.ratio simtest.ratioI
### Keywords: htest

### ** Examples


library(mratios)

########################################################

# User-defined contrasts for comparisons
# between Active control, Placebo and three dosage groups:

data(AP)
AP
boxplot(prepost~treatment, data=AP)

# Test whether the differences of doses 50, 100, 150 vs. Placebo
# are non-inferior to the difference of Active control vs. Placebo 

# User-defined contrasts:

# Numerator Contrasts:

NC <- rbind(
"(D100-D0)" = c(0,-1,1,0,0),
"(D150-D0)" = c(0,-1,0,1,0),
 "(D50-D0)" = c(0,-1,0,0,1))

# Denominator Contrasts:

DC <- rbind(
"(AC-D0)" = c(1,-1,0,0,0),
"(AC-D0)" = c(1,-1,0,0,0),
"(AC-D0)" = c(1,-1,0,0,0))

NC
DC

noninf <- simtest.ratio(prepost ~ treatment, data=AP,
 Num.Contrast=NC, Den.Contrast=DC, Margin.vec=c(0.9,0.9,0.9),
 alternative="greater")

summary( noninf )


#########################################################

## Not run: 
##D 
##D # Some more examples on standard multiple comparison procedures
##D # stated in terms of ratio hypotheses:
##D 
##D # Comparisons vs. Control:
##D 
##D many21 <- simtest.ratio(prepost ~ treatment, data=AP,
##D  type="Dunnett")
##D 
##D summary(many21)
##D 
##D # Let the Placebo be the control group, which is the second level
##D # in alpha-numeric order. A simultaneous test for superiority of
##D # the three doses and the Active control vs. Placebo could be
##D # done as: 
##D 
##D many21P <- simtest.ratio(prepost ~ treatment, data=AP,
##D  type="Dunnett", base=2, alternative="greater", Margin.vec=1.1)
##D summary(many21P)
##D 
##D # All pairwise comparisons:
##D 
##D allpairs <- simtest.ratio(prepost ~ treatment, data=AP,
##D  type="Tukey")
##D 
##D summary(allpairs)
##D 
##D #######################################################
##D 
##D # Comparison to grand mean of all strains
##D # in the Penicillin example:
##D 
##D data(Penicillin)
##D 
##D CGM <- simtest.ratio(diameter~strain, data=Penicillin, type="GrandMean")
##D CGM
##D summary(CGM)
##D 
## End(Not run)




