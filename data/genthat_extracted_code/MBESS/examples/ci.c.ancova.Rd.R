library(MBESS)


### Name: ci.c.ancova
### Title: Confidence interval for an (unstandardized) contrast in ANCOVA
###   with one covariate
### Aliases: ci.c.ancova
### Keywords: design

### ** Examples

# Maxwell & Delaney (2004, pp. 428-468) offer an example that 30 depressive 
# individuals are randomly assigned to three groups, 10 in each, and ANCOVA 
# is performed on the posttest scores using the participants' pretest 
# scores as the covariate. The means of pretest scores of group 1 to 3 are 
# 17, 17.7, and 17.4, respectively, and the adjusted means of groups 1 to 3 
# are 7.5, 12, and 14, respectively. The error variance in ANCOVA is 29, 
# and the sum of squares within groups from ANOVA on the covariate is 
# 313.37. 

# To obtain the confidence interval for adjusted mean of group 1 versus 
# group 2:
ci.c.ancova(adj.means=c(7.5, 12, 14), s.ancova=sqrt(29), c.weights=c(1, -1, 0), 
n=10, cov.means=c(17, 17.7, 17.4), SSwithin.x=313.37)


