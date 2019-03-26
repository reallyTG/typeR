library(dexter)


### Name: ability
### Title: Estimate abilities
### Aliases: ability ability_tables

### ** Examples

## Not run: 
##D db = start_new_project(verbAggrRules, "verbAggression.db")
##D add_booklet(db, verbAggrData, "agg")
##D f = fit_enorm(db)
##D aa = ability_tables(f,method="MLE",standard_errors=FALSE)
##D bb = ability_tables(f,method="EAP",standard_errors=FALSE)
##D cc = ability_tables(f,method="EAP",prior="Jeffreys", standard_errors=FALSE)
##D plot(bb$sumScore, bb$theta, xlab="test-score", ylab="ability est.", pch=19, cex=0.7)
##D points(aa$sumScore, aa$theta, col="red", pch=19, cex=0.7)
##D points(aa$sumScore, cc$theta, col="green", pch=19, cex=0.7)
##D legend("topleft", legend = c("EAP normal prior", "EAP Jeffreys prior", "MLE"), bty = "n",
##D         lwd = 1, cex = 0.7, col = c("black", "green", "red"), lty=c(0,0,0), pch = c(19,19,19))
##D 
##D close_project(db)
## End(Not run)





