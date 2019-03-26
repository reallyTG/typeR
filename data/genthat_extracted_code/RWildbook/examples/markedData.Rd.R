library(RWildbook)


### Name: markedData
### Title: Format Wildbook data for mark-recaputure analysis
### Aliases: markedData

### ** Examples


## Not run: 
##D ## You will need to supply your own login information for whaleshark.org to
##D ## run these examples.
##D 
##D ## Load packages
##D library(marked)
##D 
##D ## Extract data for individual A-001 through A-099
##D data1 <- searchWB(username="username",
##D                   password="password",
##D                   baseURL ="whaleshark.org",
##D                   object="Encounter",
##D                   individualID=paste0("A-0",rep(0:9,rep(10,10)),rep(0:9,10))[-1])
##D 
##D ## Define start and end dates of capture occasions
##D start.dates1 <- paste0(1998:2016,"-01-01") #Define the start.date value
##D end.dates1 <- paste0(1998:2016,"-04-01") #Define the end.date value
##D 
##D ## Format data for use in marked
##D markedData1.1 <- markedData(data = data1,
##D                              varname_of_capturetime = "dateInMilliseconds",
##D                              varlist = c("individualID"),
##D                              start.dates = start.dates1,
##D                              end.dates = NULL,
##D                              date_format = "%Y-%m-%d",
##D                              origin = "1970-01-01",
##D                              removeZeros = TRUE)
##D 
##D 
##D ## Fit simple CJS model in marked
##D markedData1.proc=process.data(markedData1.1,model="CJS",begin.time=1)
##D markedData1.ddl=make.design.data(markedData1.proc)
##D markedData1.cjs=crm(markedData1.proc,
##D                     markedData1.ddl,
##D                     model.parameters=list(Phi=list(formula=~time),p=list(formula=~time)))
##D 
##D ## Format data including location as a covariate
##D markedData1.2 <- markedData(data = data1,
##D                            varname_of_capturetime = "dateInMilliseconds",
##D                            varlist = c("individualID","locationID"),
##D                            start.dates = start.dates1,
##D                            end.dates = end.dates1,
##D                            date_format = "%Y-%m-%d",
##D                            origin = "1970-01-01")
## End(Not run)                           




