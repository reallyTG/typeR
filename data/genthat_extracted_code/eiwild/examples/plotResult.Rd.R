library(eiwild)


### Name: plotResult
### Title: plots result of the voter transition table
### Aliases: plotResult

### ** Examples

## Not run: 
##D # loading some fake election data
##D data(topleveldat)
##D form <- cbind(CSU_2, SPD_2, LINK_2, GRUN_2) ~ cbind(CSU_1, SPD_1, Link_1)
##D set.seed(1234)
##D res <- indAggEi(form=form, aggr=aggr, indi=indi, IDCols=c("ID","ID"),
##D                   sample=1000, thinning=2, burnin=100,verbose=100)
##D res2 <- indAggEi(form=form, aggr=aggr, indi=indi, IDCols=c("ID","ID"),
##D                  sample=1000, thinning=2, burnin=100,verbose=100)
##D 
##D 
##D tabs <- summary(res)
##D tabs2 <- summary(res2)
##D plotResult(round(tabs$relative,3))
##D plotResult(tabs$absolut, abs=TRUE)
##D bal <- getBalance(tabs$absolut, which=c("c","GRUN_2"))
##D plotResult(bal, abs=TRUE)
##D 
##D plotResult(round(tabs$relative,3), bgColors=c("white", "darkorange", 9))
##D plotResult(round(tabs$relative,3), bgColors=c("white", "darkorange", 5))
##D 
##D plotResult(round(tabs$relative,3) - round(tabs2$relative, 3), abs=TRUE,
##D            bgColors=c("white", "darkorange", 9))
##D 
##D # ugly ;)
##D plotResult(round(tabs$relative,3), bgColors=c("blue", "red", 5))
##D #' 
## End(Not run)



