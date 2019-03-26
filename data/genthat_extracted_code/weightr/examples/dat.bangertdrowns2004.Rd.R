library(weightr)


### Name: dat.bangertdrowns2004
### Title: Studies on the Effectiveness of Writing-to-Learn Interventions
### Aliases: dat.bangertdrowns2004
### Keywords: datasets

### ** Examples

## Not run: 
##D dat.bangertdrowns2004
##D 
##D # Extracting the effect sizes and sampling variances:
##D effect <- dat.bangertdrowns2004$yi
##D v <- dat.bangertdrowns2004$vi
##D 
##D # The weight-function model with no mean model:
##D weightfunct(effect, v)
##D 
##D # The weight-function model with a mean model:
##D weightfunct(effect, v, mods=~dat.bangertdrowns2004$info)
## End(Not run)



