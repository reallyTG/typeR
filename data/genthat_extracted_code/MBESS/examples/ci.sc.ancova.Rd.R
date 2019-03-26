library(MBESS)


### Name: ci.sc.ancova
### Title: Confidence interval for a standardized contrast in ANCOVA with
###   one covariate
### Aliases: ci.sc.ancova
### Keywords: design

### ** Examples

# Maxwell & Delaney (2004, pp. 428--468) offer an example that 30 depressive 
# individuals are randomly assigned to three groups, 10 in each, and ANCOVA 
# is performed on the posttest scores using the participants' pretest 
# scores as the covariate. The means of pretest scores of group 1, 2, and 3 are 
# 17, 17.7, and 17.4, respectively, whereas the adjusted means of groups 1, 2, and 3 
# are 7.5, 12, and 14, respectively. The error variance in ANCOVA is 29 and thus 
# 5.385165 is the error standard deviation, with the sum of squares within groups 
# from an ANOVA on the covariate is 752.5. 

# To obtained the confidence interval for the standardized adjusted
# mean difference between group 1 and 2, using the ANCOVA error standard
# deviation:
ci.sc.ancova(adj.means=c(7.5, 12, 14), s.ancova=5.385165, c.weights=c(1,-1,0), 
n=10, cov.means=c(17, 17.7, 17.4), SSwithin.x=752.5)

# Or, with less error in rounding:
ci.sc.ancova(adj.means=c(7.54, 11.98, 13.98), s.ancova=5.393, c.weights=c(-1,0,1), 
n=10, cov.means=c(17, 17.7, 17.4), SSwithin.x=752.5)

# Now, using the standard deviation from ANOVA (and not ANCOVA as above), we have:
ci.sc.ancova(adj.means=c(7.54, 11.98, 13.98), s.anova=6.294, s.ancova=5.393, c.weights=c(-1,0,1),
n=10, cov.means=c(17, 17.7, 17.4), SSwithin.x=752.5, standardizer= "s.anova", conf.level=.95)



