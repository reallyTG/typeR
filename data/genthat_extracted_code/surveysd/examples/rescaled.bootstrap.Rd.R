library(surveysd)


### Name: rescaled.bootstrap
### Title: Draw bootstrap replicates
### Aliases: rescaled.bootstrap

### ** Examples

data(eusilc, package = "laeken")
data.table::setDT(eusilc)

eusilc[,N.households:=sum(db090[!duplicated(db030)]),by=db040]
eusilc.bootstrap <- rescaled.bootstrap(eusilc,REP=100,strata="db040",
                                       cluster="db030",fpc="N.households")

eusilc[,new_strata:=paste(db040,rb090,sep="_")]
eusilc[,N.housholds:=sum(db090[!duplicated(db030)]),by=new_strata]
eusilc.bootstrap <- rescaled.bootstrap(eusilc,REP=100,strata=c("new_strata"),
                                       cluster="db030",fpc="N.households")

eusilc.bootstrap <- rescaled.bootstrap(eusilc,REP=100,strata=c("new_strata"),
                                       cluster="db030",fpc="N.households")





