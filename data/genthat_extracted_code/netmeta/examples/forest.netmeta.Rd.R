library(netmeta)


### Name: forest.netmeta
### Title: Forest plot for network meta-analysis
### Aliases: forest.netmeta
### Keywords: plot Forest plot

### ** Examples

data(Senn2013)

## Not run: 
##D #
##D # Conduct network meta-analysis
##D #
##D net1 <- netmeta(TE, seTE, treat1, treat2, studlab,
##D                 data=Senn2013, sm="MD")
##D 
##D forest(net1, ref="plac")
##D 
##D forest(net1, xlim=c(-1.5,1), ref="plac",
##D        xlab="HbA1c difference", rightcols=FALSE)
## End(Not run)

#
# Random effects effect model
#
net2 <- netmeta(TE, seTE, treat1, treat2, studlab,
                data=Senn2013, sm="MD", comb.fixed=FALSE)

forest(net2, xlim=c(-1.5,1), ref="plac",
       xlab="HbA1c difference")

## Not run: 
##D #
##D # Add column with P-Scores on right side of forest plot
##D #
##D forest(net2, xlim=c(-1.5,1), ref="plac",
##D        xlab="HbA1c difference",
##D        rightcols=c("effect", "ci", "Pscore"),
##D        rightlabs="P-Score",
##D        just.addcols="right")
##D 
##D #
##D # Add column with P-Scores on left side of forest plot
##D #
##D forest(net2, xlim=c(-1.5,1), ref="plac",
##D        xlab="HbA1c difference",
##D        leftcols=c("studlab", "Pscore"),
##D        leftlabs=c("Treatment", "P-Score"),
##D        just.addcols="right")
##D 
##D #
##D # Sort forest plot by descending P-Score
##D #
##D forest(net2, xlim=c(-1.5,1), ref="plac",
##D        xlab="HbA1c difference",
##D        rightcols=c("effect", "ci", "Pscore"),
##D        rightlabs="P-Score",
##D        just.addcols="right",
##D        sortvar=-Pscore)
##D 
##D #
##D # Drop reference group and sort by and print number of studies
##D # with direct treatment comparisons
##D #
##D forest(net2, xlim=c(-1.5,1), ref="plac",
##D        xlab="HbA1c difference",
##D        leftcols=c("studlab", "k"),
##D        leftlabs=c("Contrast\nto Placebo", "Direct\nComparisons"),
##D        sortvar=-k,
##D        drop=TRUE,
##D        smlab="Random Effects Model")
## End(Not run)



