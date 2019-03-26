library(tableplot)


### Name: tableplot.colldiag
### Title: Tableplot for Collinearity Diagnostics
### Aliases: tableplot.colldiag
### Keywords: hplot

### ** Examples

# Baseball data example, from Friendly & Kwan (2009)
if (require(vcd) && require(perturb)) {
	# model, with transformed variables
	Baseball$logsal <- log(Baseball$sal87)
	Baseball$years7 <- pmin(Baseball$years,7)

	base.mod <- lm(logsal ~ years+atbat+hits+homeruns+runs+rbi+walks, data=Baseball)
	if (require(car)) {
		# examine variance inflation factors
		vif(base.mod)
	}
	# corresponds to SAS: / collinoint option
	cd <- colldiag(base.mod, add.intercept=FALSE, center=TRUE)
	# simplified display
	print(cd, fuzz=.3)

	tableplot(cd)
	}




