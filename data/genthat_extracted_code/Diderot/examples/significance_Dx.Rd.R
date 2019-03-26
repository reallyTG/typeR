library(Diderot)


### Name: significance_Dx
### Title: Function to evaluate the significance of the heterocitation
###   balance value
### Aliases: significance_Dx 'Heterocitation Significance'
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D # Heterocitation in our graph
##D heterocitation(gr_sx, labels=labels, 1987, 2005)
##D ### [1] "Sx ALL /  ABM  /  IBM"
##D ### [1] "0.047 / 0.214 / 0.007"
##D ### [1] "Dx ALL /  ABM  /  IBM"
##D ### [1] "-0.927 / -0.690 / -0.982"
##D 
##D 
##D # Generate a baseline distribution for Dx values obtained through chance
##D # Here, we run 200 iterations of node corpus permutations
##D baseline<-MC_baseline_distribution(gr_sx, labels, 1987, 2018, 200)
##D 
##D # Assess whether our observed Dx is possibly due to chance
##D significance_Dx(-0.927, baseline[["Dx ALL"]])
##D ### [1] "Distribution is normal. Performing t-test."
##D ###
##D ###   One Sample t-test
##D ###
##D ### data:  value - control
##D ### t = -323.0017, df = 319, p-value < 2.2e-16
##D ### alternative hypothesis: true mean is not equal to 0
##D ### 95 percent confidence interval:
##D ###  -0.9159834 -0.9048923
##D ### sample estimates:
##D ###  mean of x 
##D ### -0.9104379 
##D ###
##D ### [1] "Glass' effect size: -18.0563442219448"
## End(Not run)



