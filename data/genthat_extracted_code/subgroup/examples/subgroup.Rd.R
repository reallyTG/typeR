library(subgroup)


### Name: subgroup
### Title: Compute measures for assessing treatment effect heterogeneity
###   across subgroups in clinical trials and produce graphical
###   presentations
### Aliases: subgroup

### ** Examples

	## No test: 
 
		# Create dataset containing treatment differences and standard errors. ------------
		difference<-c(-0.163, -0.083, -0.030, 0.095)
		se<-c(0.48, 0.27, 0.19, 0.39) 
		mydata<-cbind(difference, se)

		# Example code to produce the expected measures together with the plot created ----
		# by the subgroup routine for comparison against the observed differences. --------
		# NOTE: The execution time increases as the number of subgroups increases. --------
		test1<-subgroup(data=mydata)

		# Expected measures produced by the subgroup routine that the user ----------------
		# can manipulate to produce own graphics. -----------------------------------------
		test1$overalldiff         # Overall difference between treatment groups.
		test1$expectations        # Expectations of the ordered treatment differences.
		test1$rangedensity[1:15,] # Sample of the probability density of the range.
		test1$favourcontrol	  # Prob dist of subgroups favouring the control treatment.

		# Example code for evaluation of chance heterogeneity at the design stage. --------
		test2<-subgroup(data=mydata, design=TRUE)

		# Example code for simulation based evaluation of chance heterogeneity. -----------
		test3<-subgroup(data=mydata, force.simulation=TRUE)
		
## End(No test)

	


