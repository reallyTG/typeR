library(vcdExtra)


### Name: Dyke
### Title: Sources of Knowledge of Cancer
### Aliases: Dyke
### Keywords: datasets

### ** Examples

data(Dyke)

# independence model
mosaic(Dyke, shade=TRUE)

# null model, Knowledge as response, independent of others
require(MASS)
dyke.mod0 <- loglm(~ Knowledge + (Reading * Radio * Lectures * Newspaper), data=Dyke)
dyke.mod0
mosaic(dyke.mod0)

# view as doubledecker plot
Dyke <- Dyke[2:1,,,,]    # make Good the highlighted value of Knowledge
doubledecker(Knowledge ~ ., data=Dyke)
# better version, with some options
doubledecker(Knowledge ~ Lectures + Reading + Newspaper + Radio, data=Dyke,
	margins = c(1,6, length(dim(Dyke)) + 1, 1), 
	fill_boxes=list(rep(c("white", gray(.90)),4))
	)

# separate (conditional) plots for those who attend lectures and those who do not
doubledecker(Knowledge ~ Reading + Newspaper + Radio, data=Dyke[,,,1,],
	main="Do not attend lectures",
	margins = c(1,6, length(dim(Dyke)) + 1, 1), 
	fill_boxes=list(rep(c("white", gray(.90)),3))
	)
doubledecker(Knowledge ~ Reading + Newspaper + Radio, data=Dyke[,,,2,],
	main="Attend lectures",
	margins = c(1,6, length(dim(Dyke)) + 1, 1), 
	fill_boxes=list(rep(c("white", gray(.90)),3))
	)


drop1(dyke.mod0, test="Chisq")




