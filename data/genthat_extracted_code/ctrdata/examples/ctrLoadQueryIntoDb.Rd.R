library(ctrdata)


### Name: ctrLoadQueryIntoDb
### Title: Retrieve or update information on clinical trials from register
###   and store in database
### Aliases: ctrLoadQueryIntoDb

### ** Examples

# Retrieve protocol-related information on a single trial identified by EudraCT number
## Not run: 
##D ctrLoadQueryIntoDb (queryterm = "2013-001291-38")
## End(Not run)

# For use with EudraCT: define paediatric population and cancer terms
## Not run: 
##D queryEuDefPaedPopulation  <- "age=under-18"
##D queryEuDef01paedOncTrials <- "cancer leukaem leukem sarcoma tumour tumor blastom gliom lymphom
##D malign hodgkin ewing rhabdo teratom tumeur leucemi"
##D queryEuDef01paedOncTrials <- gsub (" ", "%20OR%20", queryEuDef01paedOncTrials)
##D queryEuDef01paedOncTrials <- paste (queryEuDef01paedOncTrials, queryEuDefPaedPopulation, sep="&")
##D ctrLoadQueryIntoDb (queryterm = queryEuDef01paedOncTrials, parallelretrivals = 5)
## End(Not run)

# Retrieve protocol-related information on ongoing interventional cancer trials in children
## Not run: 
##D ctrLoadQueryIntoDb (queryterm = "cancer&recr=Open&type=Intr&age=0", register = "CTGOV")
##D ctrLoadQueryIntoDb (queryterm = "NCT02239861", register = "CTGOV")
## End(Not run)




