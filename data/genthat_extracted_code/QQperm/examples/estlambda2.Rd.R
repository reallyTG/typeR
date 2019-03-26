library(QQperm)


### Name: estlambda2
### Title: Estimate the inflation factor for a distribution of observed
###   P-values or 1-df chi-square test.
### Aliases: estlambda2

### ** Examples

#load pre-computed p-values for IGM dataset
library(QQperm)
data("example.Ps")

#print output to pdf file only if not running in interactive mode
if (!interactive()) {
 pdf("lambda.pdf")
}

#estimate inflation factor and generate plot.
lambda <-estlambda2(example.Ps$observed,example.Ps$perm, plot = TRUE, adjust.xy = TRUE)

if (!interactive()) {
 dev.off()
}



