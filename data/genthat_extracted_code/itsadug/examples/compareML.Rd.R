library(itsadug)


### Name: compareML
### Title: Function for comparing two GAMM models.
### Aliases: compareML

### ** Examples

data(simdat)

## Not run: 
##D infoMessages("on")
##D # some arbitrary models:
##D m1 <- bam(Y~Group + s(Time, by=Group), method="fREML", data=simdat)
##D m2 <- bam(Y~Group + s(Time), method="fREML", data=simdat)
##D 
##D compareML(m1, m2)
##D 
##D # exclude significance stars:
##D compareML(m1, m2, signif.stars=FALSE)
##D 
##D m3 <- bam(Y~Group + s(Time, by=Group, k=25), method="fREML", 
##D     data=simdat)
##D compareML(m1, m3)
##D 
##D # do not print output, but save table for later use:
##D cml <- compareML(m1, m2, print.output=FALSE)$table
##D cml
##D 
##D # Use suppressWarnings to also suppress warnings:
##D suppressWarnings(cml <- compareML(m1, m2, print.output=FALSE)$table)
##D 
## End(Not run)



