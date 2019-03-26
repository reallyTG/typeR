library(rsdmx)


### Name: readSDMX
### Title: readSDMX
### Aliases: readSDMX

### ** Examples

# SDMX datasets
 #--------------
 ## Not run: 
##D    # Not run
##D    # (local dataset examples)
##D    #with SDMX 2.0
##D    tmp <- system.file("extdata","Example_Eurostat_2.0.xml", package="rsdmx")
##D    sdmx <- readSDMX(tmp, isURL = FALSE)
##D    stats <- as.data.frame(sdmx)
##D    head(stats)
##D 
##D    #with SDMX 2.1
##D    tmpnew <- system.file("extdata","Example_Eurostat_2.1.xml", package="rsdmx")
##D    sdmx <- readSDMX(tmpnew, isURL = FALSE)
##D    stats <- as.data.frame(sdmx)
##D    head(stats)
##D    ## End(**Not run**)
##D  
## End(Not run)

 ## No test: 
   # Not run by 'R CMD check'
   # (reliable remote datasource but with possible occasional unavailability)

   #examples using embedded providers
   sdmx <- readSDMX(providerId = "OECD", resource = "data", flowRef = "MIG",
                     key = list("TOT", NULL, NULL), start = 2011, end = 2011)
   stats <- as.data.frame(sdmx)
   head(stats)

   #examples using 'file' argument
   #using url (Eurostat REST SDMX 2.1)
   url <- paste("http://ec.europa.eu/eurostat/SDMX/diss-web/rest/data/",
                "cdh_e_fos/all/?startperiod=2000&endPeriod=2010",
                sep = "")
   sdmx <- readSDMX(url)
   stats <- as.data.frame(sdmx)
   head(stats)

   ## End(**Not run**)
 
## End(No test)

 # SDMX DataStructureDefinition (DSD)
 #-----------------------------------
 ## No test: 
   # Not run by 'R CMD check'
   # (reliable remote datasource but with possible occasional unavailability)

   #using embedded providers
   dsd <- readSDMX(providerId = "OECD", resource = "datastructure",
                   resourceId = "WATER_ABSTRACT")

   #get codelists from DSD
   cls <- slot(dsd, "codelists")
   codelists <- sapply(slot(cls,"codelists"), slot, "id") #get list of codelists

   #get a codelist
   codelist <- as.data.frame(cls, codelistId = "CL_WATER_ABSTRACT_SOURCE")

   #get concepts from DSD
   concepts <- as.data.frame(slot(dsd, "concepts"))

   ## End(**Not run**)
 
## End(No test)



