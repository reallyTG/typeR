library(InformativeCensoring)


### Name: ScoreImpute
### Title: Perform risk score multiple imputation method
### Aliases: ScoreImpute

### ** Examples


data(ScoreInd)

col.control <- col.headings(has.event="event", time="time",
                            Id="Id",arm="arm",
                            DCO.time="DCO.time", 
                            to.impute="to.impute")

## Not run: 
##D ans <- ScoreImpute(data=ScoreInd,event.model=~Z1+Z2+Z3+Z4+Z5,
##D                    col.control=col.control, m=5,
##D                    bootstrap.strata=ScoreInd$arm,
##D                    NN.control=NN.options(NN=5,w.censoring = 0.2))
## End(Not run)




