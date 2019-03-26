library(SAScii)


### Name: SAScii-package
### Title: Import ASCII files directly into R using only a SAS input script
### Aliases: SAScii-package SAScii

### ** Examples

## Not run: 
##D 
##D ##Load the 2009 Medical Expenditure Panel Survey Emergency Room Visits file as an R data frame
##D 
##D #Location of the ASCII 2009 Medical Expenditure Panel Survey Emergency Room Visits File
##D MEPS.09.ER.visit.file.location <- 
##D 	"http://meps.ahrq.gov/mepsweb/data_files/pufs/h126edat.exe"
##D 
##D #Location of the SAS import instructions for the
##D #2009 Medical Expenditure Panel Survey Emergency Room Visits File
##D MEPS.09.ER.visit.SAS.read.in.instructions <- 
##D 	"http://meps.ahrq.gov/mepsweb/data_stats/download_data/pufs/h126e/h126esu.txt"
##D 
##D #Load the 2009 Medical Expenditure Panel Survey Emergency Room Visits File
##D #NOTE: The SAS INPUT command occurs at line 273.
##D MEPS.09.ER.visit.df <- 
##D 	read.SAScii ( MEPS.09.ER.visit.file.location , 
##D 					MEPS.09.ER.visit.SAS.read.in.instructions , 
##D 					zipped = T , 
##D 					beginline = 273 )
##D 
##D #save the data frame now for instantaneous loading later
##D save( MEPS.09.ER.visit.df , file = "MEPS.09.ER.visit.data.rda" )
##D 
##D ##Load the 2011 National Health Interview Survey Persons file as an R data frame
##D 
##D NHIS.11.personsx.SAS.read.in.instructions <- 
##D 	"ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Program_Code/NHIS/2011/personsx.sas"
##D NHIS.11.personsx.file.location <- 
##D 	"ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/NHIS/2011/personsx.zip"
##D 
##D #store the NHIS file as an R data frame
##D NHIS.11.personsx.df <- 
##D 	read.SAScii ( 
##D 		NHIS.11.personsx.file.location , 
##D 		NHIS.11.personsx.SAS.read.in.instructions , 
##D 		zipped = T )
##D 
##D #or store the NHIS SAS import instructions for use in a 
##D #read.fwf function call outside of the read.SAScii function
##D NHIS.11.personsx.sas <- 
##D 	parse.SAScii( NHIS.11.personsx.SAS.read.in.instructions )
##D 
##D #save the data frame now for instantaneous loading later
##D save( NHIS.11.personsx.df , file = "NHIS.11.personsx.data.rda" )
##D 
##D 
##D ##Load the 2011 National Health Interview Survey Sample Adult file as an R data frame
##D 
##D NHIS.11.samadult.SAS.read.in.instructions <- 
##D 	"ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Program_Code/NHIS/2011/samadult.sas"
##D NHIS.11.samadult.file.location <- 
##D 	"ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/NHIS/2011/samadult.zip"
##D 
##D #store the NHIS file as an R data frame!
##D NHIS.11.samadult.df <- 
##D 	read.SAScii ( 
##D 		NHIS.11.samadult.file.location , 
##D 		NHIS.11.samadult.SAS.read.in.instructions , 
##D 		zipped = T )
##D 
##D #or store the NHIS SAS import instructions for use in a
##D #read.fwf function call outside of the read.SAScii function
##D NHIS.11.samadult.sas <- 
##D 	parse.SAScii( NHIS.11.samadult.SAS.read.in.instructions )
##D 
##D #save the data frame now for instantaneous loading later
##D save( NHIS.11.samadult.df , file = "NHIS.11.samadult.data.rda" )
## End(Not run)



