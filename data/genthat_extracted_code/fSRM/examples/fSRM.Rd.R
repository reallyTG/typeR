library(fSRM)


### Name: fSRM
### Title: Run a Social Relations Model with roles ("Family SRM")
### Aliases: fSRM

### ** Examples

# Example from Dyadic Data Analysis
data(two.indicators)
# 4 persons, 1 indicator
f4.1 <- fSRM(dep1 ~ actor.id*partner.id | family.id, two.indicators)
f4.1		# by default, one-sided p-values and CIs are printed for variances
print(f4.1, var.onesided=FALSE)	# Show two-sided p-values and CIs for variances
plot(f4.1)	# plot relative variances
plot(f4.1, bw=TRUE)

## Not run: 
##D # 4 persons, 2 indicators
##D f4.2 <- fSRM(dep1/dep2 ~ actor.id*partner.id | family.id, two.indicators)
##D f4.2
##D plot(f4.2, bw=TRUE)
##D plot(f4.2, bw=TRUE, onlyStable=TRUE)
##D 
##D # 4 persons, 1 indicator, mean structure
##D f4.1.m <- fSRM(dep1 ~ actor.id*partner.id | family.id, two.indicators, means=TRUE)
##D f4.1.m
##D plot(f4.1.m, means=TRUE)		# plot mean structure
##D 
##D # 4 persons, 2 indicators, mean structure
##D f4.2.m <- fSRM(dep1/dep2 ~ actor.id*partner.id | family.id, two.indicators, means=TRUE)
##D f4.2.m
##D 
##D # ... add intragenerational similarity (now results are identical to Cook, 2000)
##D f4.ig <- fSRM(dep1/dep2 ~ actor.id*partner.id | family.id, two.indicators, 
##D               IGSIM=list(c("m", "f"), c("c", "y")))
##D f4.ig
##D 
##D ## ======================================================================
##D ## Wald-test for equality of means
##D ## ======================================================================
##D 
##D f4.1.m <- fSRM(dep1 ~ actor.id*partner.id | family.id, two.indicators, means=TRUE)
##D f4.1.m
##D equalMeans(f4.1.m)
##D 
##D # construct a 3-person data set
##D two.indicators3 <- 
##D two.indicators[two.indicators$actor.id != "y" & two.indicators$partner.id != "y", ]
##D f3.2.m <- fSRM(dep1/dep2 ~ actor.id*partner.id | family.id, two.indicators3, means=TRUE)
##D f3.2.m
##D equalMeans(f3.2.m)
##D 
##D 
##D 
##D # ---------------------------------------------------------------------
##D # Run analyses based on Eichelsheim, V. I., Buist, K. L., Dekovic, M., 
##D   Cook, W. L., Manders, W., Branje, S. J. T., Frijns, T., et al. (2011). 
##D   Negativity in problematic and nonproblematic families: 
##D   A multigroup social relations model analysis with structured means. 
##D   Journal of Family Psychology, 25, 152-156. doi:10.1037/a0022450
##D 
##D # The data set is a simulated data set which has 
##D # comparable properties as the original data set
##D 
##D data(two.groups)
##D str(two.groups)
##D 
##D E1 <- fSRM(neg ~ actor.id*partner.id | family.id, data=two.groups)
##D E1
##D 
##D # make group comparison: 
##D # group = 1: non-problematic families, group = 2: problematic families
##D # The data set must contain exactly two groups, otherwise an error is printed
##D E2 <- fSRM(neg ~ actor.id*partner.id | family.id, data=two.groups, group="group")
##D E2
##D 
##D # Compare means and differences between groups. Beware: This model takes *really* long ...
##D E3 <- fSRM(neg ~ actor.id*partner.id | family.id, 
##D            data=two.groups, group="group", means=TRUE, diff=TRUE)
##D E3
##D 
## End(Not run)



