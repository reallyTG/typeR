library(HH)


### Name: multicomp.order
### Title: Update a multicomp object by ordering its contrasts.
### Aliases: multicomp.order multicomp.label.change
###   multicomp.label.change.multicomp multicomp.label.change.mmc.multicomp
### Keywords: dplot

### ** Examples

## continue with the example in mmc in R, or multicomp.mmc in S-Plus
data(catalystm)

catalystm1.aov <- aov(concent ~ catalyst, data=catalystm)

if.R(r={
catalystm.mca <-
   glht(catalystm1.aov, linfct = mcp(catalyst = "Tukey"))
print(confint(catalystm.mca))

catalystm.mmc <-
   mmc(catalystm1.aov, linfct = mcp(catalyst = "Tukey"))
## the contrasts have been ordered by height (see ?MMC),
## which in this example corresponds to sort.order=c(1,2,4,3,5,6),
## and reversed, to make the contrast Estimates positive.
print(as.glht(catalystm.mmc$mca))

## ## For consistency with the S-Plus example,
## ## we change all factor level "A" to "control".
## as.glht(multicomp.label.change(catalystm.mmc$mca, "A", "control"))
},s={
catalystm.mca <-
   multicomp(catalystm1.aov, method="Tukey")
print(catalystm.mca)

catalystm.mmc <-
   multicomp.mmc(catalystm1.aov, method="Tukey", plot=FALSE)
## the contrasts have been ordered by height (see ?MMC),
## which in this example corresponds to sort.order=c(1,2,4,3,5,6),
## and reversed, to make the contrast Estimates positive.
print(catalystm.mmc$mca)

## S-Plus multicomp already uses simple names.  This function is
## therefore used in more complex two-way ANOVA examples.  We illustrate
## here by changing all factor level "A" to "control".
print(multicomp.label.change(catalystm.mmc$mca, "A", "control"))
})




