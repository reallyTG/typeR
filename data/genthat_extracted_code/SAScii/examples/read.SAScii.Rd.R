library(SAScii)


### Name: read.SAScii
### Title: Create an R data frame by reading in an ASCII file and SAS
###   import instructions
### Aliases: read.SAScii withWarnings

### ** Examples


###########
#Some Data#
###########

#write an example ASCII data set
some.data <- "0154hello2304coolgreatZZ\n2034puppy0023nicesweetok\n9900buddy4495    swell!!"

#create temporary ASCII file
some.data.tf <- tempfile()
#write the sas code above to that temporary file
writeLines ( some.data , con = some.data.tf )

#write an example SAS import script using the at method
sas.import.with.at.signs <-
	"INPUT
		@1 NUMBERS1 4.2
		@5 WORDS1 $ 5.
		@10 NUMBERS2 2.0
		@12 NUMBERS3 2.0
		@14 WORDS2 $4.
		@18 WORDS3 $5
		@23 WORDS4 $ 1
		@24 WORDS5 $ 1
	;"
	

#create a temporary file
sas.import.with.at.signs.tf <- tempfile()
#write the sas code above to that temporary file
writeLines ( sas.import.with.at.signs , con = sas.import.with.at.signs.tf )

parse.SAScii( sas.import.with.at.signs.tf )

#using at signs sas script
read.SAScii( some.data.tf , sas.import.with.at.signs.tf )


#write an example SAS import script using the dash method
sas.import.with.lengths <-
	"INPUT
		NUMBERS1 1 - 4 .2
		WORDS1 $ 5-9
		NUMBERS2 10 -11
		NUMBERS3 12- 13 .0
		WORDS2 $14-17
		WORDS3$ 18-22
		WORDS4   $   23-23
		WORDS5 $24
	;"
	
#create a temporary file
sas.import.with.lengths.tf <- tempfile()
#write the sas code above to that temporary file
writeLines ( sas.import.with.lengths , con = sas.import.with.lengths.tf )

parse.SAScii( sas.import.with.lengths.tf )

#using dash method sas script
read.SAScii( some.data.tf , sas.import.with.lengths.tf )

## Not run: 
##D 
##D 
##D #########################################################################################
##D #Load the 2009 Medical Expenditure Panel Survey Emergency Room Visits file as an R data frame
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
##D 	read.SAScii ( 
##D 		MEPS.09.ER.visit.file.location , 
##D 		MEPS.09.ER.visit.SAS.read.in.instructions , 
##D 		zipped = T , 
##D 		beginline = 273 )
##D 
##D #save the data frame now for instantaneous loading later
##D save( MEPS.09.ER.visit.df , file = "MEPS.09.ER.visit.data.rda" )
##D 
##D 
##D #########################################################################################
##D #Load the 2011 National Health Interview Survey Persons file as an R data frame
##D 
##D NHIS.11.personsx.SAS.read.in.instructions <- 
##D 	"ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Program_Code/NHIS/2011/personsx.sas"
##D NHIS.11.personsx.file.location <- 
##D 	"ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/NHIS/2011/personsx.zip"
##D 
##D #store the NHIS file as an R data frame!
##D NHIS.11.personsx.df <- 
##D 	read.SAScii ( 
##D 		NHIS.11.personsx.file.location , 
##D 		NHIS.11.personsx.SAS.read.in.instructions , 
##D 		zipped = T )
##D 
##D #or store the NHIS SAS import instructions for use in a 
##D #read.fwf function call outside of the read.SAScii function
##D NHIS.11.personsx.sas <- parse.SAScii( NHIS.11.personsx.SAS.read.in.instructions )
##D 
##D #save the data frame now for instantaneous loading later
##D save( NHIS.11.personsx.df , file = "NHIS.11.personsx.data.rda" )
##D 
##D 
##D #########################################################################################
##D #Load the 2011 National Health Interview Survey Sample Adult file as an R data frame
##D 
##D NHIS.11.samadult.SAS.read.in.instructions <- 
##D 	"ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Program_Code/NHIS/2011/SAMADULT.sas"
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
##D NHIS.11.samadult.sas <- parse.SAScii( NHIS.11.samadult.SAS.read.in.instructions )
##D 
##D #save the data frame now for instantaneous loading later
##D save( NHIS.11.samadult.df , file = "NHIS.11.samadult.data.rda" )
##D 
##D 
##D #########################################################################################
##D #Load an IPUMS - American Community Survey Extract into R
##D 
##D #DOES NOT RUN without downloading ACS ASCII files to
##D #your local drive from http://www.ipums.org/
##D 
##D #MINNESOTA POPULATION CENTER - IPUMS ASCII EXTRACTS & SAS import instructions
##D IPUMS.file.location <- "./IPUMS/usa_00001.dat"
##D IPUMS.SAS.read.in.instructions <- "./IPUMS/usa_00001.sas"
##D 
##D #store the IPUMS extract as an R data frame!
##D IPUMS.df <- 
##D 	read.SAScii ( 
##D 		IPUMS.file.location , 
##D 		IPUMS.SAS.read.in.instructions , 
##D 		zipped = F )
##D 
##D #or store the IPUMS extract SAS import instructions for use in a 
##D #read.fwf function call outside of the read.SAScii function
##D IPUMS.sas <- parse.SAScii( IPUMS.SAS.read.in.instructions )
##D 
##D 
##D #########################################################################################
##D #Load the Current Population Survey - 
##D #Annual Social and Economic Supplement - March 2011 as an R data frame
##D 
##D #census.gov website containing the current population survey's main file
##D CPS.ASEC.mar11.file.location <- 
##D 	"http://smpbff2.dsd.census.gov/pub/cps/march/asec2011_pubuse.zip"
##D CPS.ASEC.mar11.SAS.read.in.instructions <- 
##D 	"http://www.nber.org/data/progs/cps/cpsmar11.sas"
##D 
##D #create a temporary file and a temporary directory..
##D tf <- tempfile() ; td <- tempdir()
##D #download the CPS repwgts zipped file
##D download.file( CPS.ASEC.mar11.file.location , tf , mode = "wb" )
##D #unzip the file's contents and store the file name within the temporary directory
##D fn <- unzip( tf , exdir = td , overwrite = T )
##D 
##D #the CPS March Supplement ASCII/FWF contains household-, family-, and person-level records.
##D #throw out records that are not person-level.
##D #according to the SAS import instructions, person-level record lines begin with a "3"
##D 
##D #create a second temporary file
##D tf.sub <- tempfile()
##D 
##D input <- fn
##D output <- tf.sub
##D 
##D incon <- file(input, "r") 
##D outcon <- file(output, "w") 
##D 
##D #cycle through every line in the downloaded CPS file..
##D while(length(line <- readLines(incon, 1))>0){
##D 	#and if the first letter is a 3, add it to the new person-only CPS file.
##D 	if ( substr( line , 1 , 1 ) == "3" ){
##D 		writeLines(line,outcon)
##D 	}
##D }
##D close(outcon)
##D close(incon , add = T)
##D 
##D #the SAS file produced by the National Bureau of Economic Research (NBER)
##D #begins the person-level INPUT after line 1209, 
##D #so skip SAS import instruction lines before that.
##D #NOTE that the beginline of 1209 will change for different years.
##D 
##D #store the CPS ASEC March 2011 file as an R data frame!
##D cps.asec.mar11.df <- 
##D 	read.SAScii ( 
##D 		tf.sub , 
##D 		CPS.ASEC.mar11.SAS.read.in.instructions , 
##D 		beginline = 1209 , 
##D 		zipped = F )
##D 
##D #or store the CPS ASEC March 2011 SAS import instructions for use in a 
##D #read.fwf function call outside of the read.SAScii function
##D cps.asec.mar11.sas <- 
##D 	parse.SAScii( CPS.ASEC.mar11.SAS.read.in.instructions , beginline = 1209 )
##D 
##D 
##D #########################################################################################
##D #Load the Replicate Weights file of the Current Population Survey 
##D #March 2011 as an R data frame
##D 
##D #census.gov website containing the current population survey's replicate weights file
##D CPS.replicate.weight.file.location <- 
##D 	"http://smpbff2.dsd.census.gov/pub/cps/march/CPS_ASEC_ASCII_REPWGT_2011.zip"
##D CPS.replicate.weight.SAS.read.in.instructions <- 
##D 	"http://smpbff2.dsd.census.gov/pub/cps/march/CPS_ASEC_ASCII_REPWGT_2011.SAS"
##D 
##D #store the CPS repwgt file as an R data frame!
##D cps.repwgt.df <- 
##D 	read.SAScii ( 
##D 		CPS.replicate.weight.file.location , 
##D 		CPS.replicate.weight.SAS.read.in.instructions , 
##D 		zipped = T )
##D 
##D #or store the CPS repwgt SAS import instructions for use in a 
##D #read.fwf function call outside of the read.SAScii function
##D cps.repwgt.sas <- parse.SAScii( CPS.replicate.weight.SAS.read.in.instructions )
##D 
##D 	
##D #########################################################################################
##D #Load the 2008 Survey of Income and Program Participation Wave 1 as an R data frame
##D SIPP.08w1.SAS.read.in.instructions <- 
##D 	"http://smpbff2.dsd.census.gov/pub/sipp/2008/l08puw1.sas"
##D SIPP.08w1.file.location <- 
##D 	"http://smpbff2.dsd.census.gov/pub/sipp/2008/l08puw1.zip"
##D 
##D #store the SIPP file as an R data frame
##D 
##D #note the text "INPUT" appears before the actual INPUT block of the SAS code
##D #so the parsing of the SAS instructions will fail without a beginline parameter specifying
##D #where the appropriate INPUT block occurs
##D 
##D SIPP.08w1.df <- 
##D 	read.SAScii ( 
##D 		SIPP.08w1.file.location , 
##D 		SIPP.08w1.SAS.read.in.instructions , 
##D 		beginline = 5 , 
##D 		buffersize = 10 , 
##D 		zipped = T )
##D 
##D #or store the SIPP SAS import instructions for use in a 
##D #read.fwf function call outside of the read.SAScii function
##D SIPP.08w1.sas <- parse.SAScii( SIPP.08w1.SAS.read.in.instructions , beginline = 5 )
##D 
##D 
##D #########################################################################################
##D #Load the Replicate Weights file of the 
##D #2008 Survey of Income and Program Participation Wave 1 as an R data frame
##D SIPP.repwgt.08w1.SAS.read.in.instructions <- 
##D 	"http://smpbff2.dsd.census.gov/pub/sipp/2008/rw08wx.sas"
##D SIPP.repwgt.08w1.file.location <- 
##D 	"http://smpbff2.dsd.census.gov/pub/sipp/2008/rw08w1.zip"
##D 
##D #store the SIPP file as an R data frame
##D 
##D #note the text "INPUT" appears before the actual INPUT block of the SAS code
##D #so the parsing of the SAS instructions will fail without a beginline parameter specifying
##D #where the appropriate INPUT block occurs
##D 
##D SIPP.repwgt.08w1.df <- 
##D 	read.SAScii ( 
##D 		SIPP.repwgt.08w1.file.location , 
##D 		SIPP.repwgt.08w1.SAS.read.in.instructions , 
##D 		beginline = 5 , 
##D 		zipped = T )
##D 
##D #store the SIPP SAS import instructions for use in a 
##D #read.fwf function call outside of the read.SAScii function
##D SIPP.repwgt.08w1.sas <- 
##D 	parse.SAScii( 
##D 		SIPP.repwgt.08w1.SAS.read.in.instructions , 
##D 		beginline = 5 )
##D 
##D 
##D #########################################################################################
##D #Load all twelve waves of the 2004 Survey of Income and Program Participation as R data frames
##D 	
##D SIPP.04w1.SAS.read.in.instructions <- 
##D 	"http://smpbff2.dsd.census.gov/pub/sipp/2004/l04puw1.sas"
##D 
##D #store the SIPP SAS import instructions for use in a 
##D #read.fwf function call outside of the read.SAScii function
##D SIPP.04w1.sas <- parse.SAScii( SIPP.04w1.SAS.read.in.instructions , beginline = 5 )
##D 
##D #note the text "INPUT" appears before the actual INPUT block of the SAS code
##D #so the parsing of the SAS instructions will fail without a beginline parameter specifying
##D #where the appropriate INPUT block occurs
##D 
##D #loop through all 12 waves of SIPP 2004
##D for ( i in 1:12 ){
##D 	
##D 	SIPP.04wX.file.location <- 
##D 		paste( "http://smpbff2.dsd.census.gov/pub/sipp/2004/l04puw" , i , ".zip" , sep = "" )
##D 
##D 	#name the data frame based on the current wave
##D 	df.name <- paste( "SIPP.04w" , i , ".df" , sep = "" )
##D 	
##D 	#store the SIPP file as an R data frame!
##D 	assign( 
##D 	
##D 		df.name , 
##D 		
##D 		read.SAScii ( 
##D 			SIPP.04wX.file.location , 
##D 			SIPP.04w1.SAS.read.in.instructions , 
##D 			beginline = 5 , 
##D 			buffersize = 5 , 
##D 			zipped = T )
##D 	)
##D 
##D }
## End(Not run)



