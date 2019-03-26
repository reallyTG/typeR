library(gap)


### Name: ESplot
### Title: Effect-size plot
### Aliases: ESplot
### Keywords: hplot

### ** Examples

## Not run: 
##D # 7-4-2008 MRC-Epid JHZ
##D options(stringsAsFactors=FALSE)
##D testdata <- data.frame(models=c("Basic model","Adjusted","Moderately adjusted",
##D                       "Heavily adjusted","Other"),
##D OR = c(4.5,3.5,2.5,1.5,1),
##D SElogOR = c(0.2,0.1,0.5,0.5,0.2))
##D ESplot(testdata,v=1)
##D title("This is a fictitious plot")
##D #
##D # Quantitative trait, as appropriate for linear regression
##D # testdata <- data.frame(modelid, beta, se(beta))
##D # ESplot(testdata, logscale=FALSE)
##D #
##D # Other scenarios
##D # OR with CI
##D # ESplot(testdata,SE=FALSE)
## End(Not run)



