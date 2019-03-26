library(MBESS)


### Name: power.equivalence.md
### Title: Power of Two One-Sided Tests Procedure (TOST) for Equivalence
### Aliases: power.equivalence.md
### Keywords: design

### ** Examples

 # Suppose that two formulations of a drug are to be compared on 
 # the regular scale using a two-period crossover design, with 
 # theta1 = -0.20, theta2 = 0.20, rm{CV} = 0.20, the 
 # difference in the mean bioavailability is 0.05 (5 percent), and we choose 
 # n=24, corresponding to 22 degrees of freedom.  We need to test 
 # bioequivalence at the 5 percent significance level, which corresponds to 
 # having a 90 percent confidence interval lying within (-0.20, 0.20). Then 
 # the power will be 0.8029678.  This corresponds to Phillips (1990), 
 # Table 1, 5th row, 5th column, and Figure 3.  Use
 
power.equivalence.md(.05, FALSE, -.2, .2, .05, .20, 24, 22)


# If the formulations are compared on the logarithmic scale with 
# theta1 = 0.80, theta2 = 1.25, n=18 (16 degrees of freedom), and 
# a ratio of test to reference of 1.05. Then the power will be 0.7922796.
# This corresponds to Diletti, Table 1, power=.80, CV=.20, ratio=1.05, and Figure 1c. Use

power.equivalence.md(.05, TRUE, .8, 1.25, 1.05, .20, 18, 16)



