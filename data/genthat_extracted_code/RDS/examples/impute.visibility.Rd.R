library(RDS)


### Name: impute.visibility
### Title: Estimates each person's personal visibility based on their
###   self-reported degree and the number of their (direct) recruits. It
###   uses the time the person was recruited as a factor in determining the
###   number of recruits they produce.
### Aliases: impute.visibility

### ** Examples

## Not run: 
##D data(fauxmadrona)
##D # The next line fits the model for the self-reported personal
##D # network sizes and imputes the personal network sizes 
##D # It may take up to 60 seconds.
##D visibility <- impute.visibility(fauxmadrona)
##D # frequency of estimated personal visibility
##D table(visibility)
## End(Not run)



