library(apsrtable)


### Name: notefunctions
### Title: Table notes
### Aliases: notefunctions se.note stars.note pval.note

### ** Examples

### Custom note function

signif.pct <- function(env) {
  paste("$^*$ significant at", evalq(lev,envir=env)*100, "percent")
}
### Continue the example from apsrtable
## Not run: 
##D apsrtable(lm.D90, lm.D9, glm.D9, digits=1, align="left",
##D           stars=1, lev=0.05, model.counter=0, order="rl",
##D           notes=list(se.note, signif.pct, 
##D             "Plant weight data from the lm() example" )
##D 	 )
## End(Not run)



