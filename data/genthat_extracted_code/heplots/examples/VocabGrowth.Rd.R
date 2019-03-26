library(heplots)


### Name: VocabGrowth
### Title: Vocabulary growth data
### Aliases: VocabGrowth
### Keywords: datasets

### ** Examples

data(VocabGrowth)

# Standard Multivariate & Univariate repeated measures analysis
Vocab.mod <- lm(cbind(grade8,grade9,grade10,grade11) ~ 1, data=VocabGrowth)
idata <-data.frame(grade=ordered(8:11))
Anova(Vocab.mod, idata=idata, idesign=~grade, type="III")

##Type III Repeated Measures MANOVA Tests: Pillai test statistic
##            Df test stat approx F num Df den Df    Pr(>F)    
##(Intercept)  1     0.653  118.498      1     63 4.115e-16 ***
##grade        1     0.826   96.376      3     61 < 2.2e-16 ***


heplot(Vocab.mod, type="III", idata=idata, idesign=~grade, iterm="grade",
	main="HE plot for Grade effect")

### doing this 'manually' by explicitly transforming Y -> Y M
# calculate Y M, using polynomial contrasts
trends <- as.matrix(VocabGrowth) %*% poly(8:11, degree=3)
colnames(trends)<- c("Linear", "Quad", "Cubic")

# test all trend means = 0 == Grade effect
within.mod <- lm(trends ~ 1)

Manova(within.mod)
heplot(within.mod, terms="(Intercept)", col=c("red", "blue"), type="3",
  term.labels="Grade",
  main="HE plot for Grade effect")
mark.H0()



