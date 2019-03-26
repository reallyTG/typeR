library(EdSurvey)


### Name: rename.sdf
### Title: Modify Variable Names
### Aliases: rename.sdf

### ** Examples

## Not run: 
##D usaG4.15 <- readTIMSS("C:/TIMSS2015", "usa", 4)
##D usaG4.15.renamed <- rename.sdf(usaG4.15,
##D                                c("itsex", "mmat"),
##D                                c("gender", "math_overall"))
##D lm1 <- lm.sdf(math_overall ~ gender, data = usaG4.15.renamed)
##D summary(lm1)
## End(Not run)



