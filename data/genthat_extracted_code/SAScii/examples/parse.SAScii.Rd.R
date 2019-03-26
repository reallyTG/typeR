library(SAScii)


### Name: parse.SAScii
### Title: Convert SAS import instructions into the arguments for a
###   read.fwf function call.
### Aliases: parse.SAScii SAS.uncomment

### ** Examples



###########
#Some Data#
###########

#write an example ASCII data set
some.data <- 
	"0154hello2304coolgreatZZ
	2034puppy0023nicesweetok
	9900buddy4495    swell!!"

#create temporary ASCII file
some.data.tf <- tempfile()
#write the sas code above to that temporary file
writeLines ( some.data , con = some.data.tf )

#write an example SAS import script using the @ method
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


############################################
#Survey of Income and Program Participation#
############################################

#first fourteen lines pulled from the Survey of Income and Program Participation
#http://smpbff2.dsd.census.gov/pub/sipp/2008/l08puw1.sas

sipp.sas <- 
	"LIBNAME sas8 v8 'current directory';
	FILENAME INPUTDAT 'l08puw1.dat' ;
	DATA sas8.l08puw1 ;
	INFILE INPUTDAT PAD LRECL=2341 ;
	INPUT
	 SSUSEQ 1- 5
	 SSUID $ 6- 17
	 SPANEL 18- 21
	 SWAVE 22- 23
	 SROTATON 24- 24
	 SREFMON 25- 25
	 RHCALMN 26- 27
	 RHCALYR 28- 31
	 SHHADID 32- 34
	 GVARSTR 35- 37
	 GHLFSAM 38- 38
	 GRGC $ 39- 41
	 TFIPSST 42- 43
	 TMOVRFLG 44- 45
			; RUN;"

#create a temporary file
sipp.tf <- tempfile()
#write the sas code above to that temporary file
writeLines ( sipp.sas , con = sipp.tf )
#parse that temporary file
sipp.fwf.parameters <- parse.SAScii( sipp.tf , beginline = 5 )
#print the results to the screen
sipp.fwf.parameters

###################################################
#NATIONAL HEALTH INTERVIEW SURVEY - IMPUTED INCOME#
###################################################

#INPUT lines pulled from the 2011 National Health Interview Survey's Imputed Income file
#ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/NHIS/2011_imputed_income/incmimp.sas

nhis.incmimp.sas <- 
	"   * INPUT ALL VARIABLES;

	   INPUT
	  RECTYPE  1-2   SRVY_YR  3-6  
	  HHX   7-12  FMX   13-14
	  FPX   15-16  IMPNUM   17   
	  FAMINCF2 18   TCINCM_F  19
	  FAMINCI2  20-25  POVRATI3  26-34
	  EMPLOY_F  35    EMPLOY_I  36    
	  ERNYR_F  37    TCEARN_F  38
	  ERNYR_I2  39-44
	  ;

	   * DEFINE VARIABLE LABELS;"

#create a temporary file
nhis.incmimp.tf <- tempfile()
#write the sas code above to that temporary file
writeLines ( nhis.incmimp.sas , con = nhis.incmimp.tf )
#parse that temporary file
nhis.incmimp.fwf.parameters <- parse.SAScii( nhis.incmimp.tf )
#print the results to the screen
nhis.incmimp.fwf.parameters


###################################################
#NATIONAL HEALTH INTERVIEW SURVEY - IMPUTED INCOME#
###################################################

#INPUT lines pulled from the 2011 National Health Interview Survey's Sample Adult file
#ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Program_Code/NHIS/2011/samadult.sas

nhis.samadult.sas <- 
	"   * INPUT ALL VARIABLES;

	   INPUT

		  /* IDN LOCATIONS */

		  RECTYPE       1 -   2    SRVY_YR       3 -   6
		  HHX      $    7 -  12    INTV_QRT     13 -  13
		  ASSIGNWK     14 -  15    FMX      $   16 -  17
		  FPX      $   18 -  19    WTIA_SA      20 -  26 .1
		  WTFA_SA      27 -  32

		  /* UCF LOCATIONS */

		  REGION       33 -  33    STRAT_P      34 -  36
		  PSU_P        37 -  38
		;"

#create a temporary file
nhis.samadult.tf <- tempfile()
#write the sas code above to that temporary file
writeLines ( nhis.samadult.sas , con = nhis.samadult.tf )
#parse that temporary file
nhis.samadult.fwf.parameters <- parse.SAScii( nhis.samadult.tf )
#print the results to the screen
nhis.samadult.fwf.parameters


## Not run: 
##D 
##D #########################################################################################
##D #Create the read.fwf parameters required to load the
##D #2009 Medical Expenditure Panel Survey Emergency Room Visits file
##D 
##D #Location of the SAS import instructions for the
##D #2009 Medical Expenditure Panel Survey Emergency Room Visits File
##D MEPS.09.ER.visit.SAS.read.in.instructions <- 
##D 	"http://meps.ahrq.gov/mepsweb/data_stats/download_data/pufs/h126e/h126esu.txt"
##D 
##D #Load the 2009 Medical Expenditure Panel Survey Emergency Room Visits File
##D #NOTE: The SAS INPUT command occurs at line 273.
##D MEPS.09.ER.visit.sas <- 
##D 	parse.SAScii ( MEPS.09.ER.visit.SAS.read.in.instructions , beginline = 273 )
##D 
##D 
##D #########################################################################################
##D #Create the read.fwf parameters required to load the
##D #2011 National Health Interview Survey Persons file
##D 
##D NHIS.11.personsx.SAS.read.in.instructions <- 
##D 	"ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Program_Code/NHIS/2011/personsx.sas"
##D 
##D #store the NHIS SAS import instructions for use in a 
##D #read.fwf function call outside of the read.SAScii function
##D NHIS.11.personsx.sas <- 
##D 	parse.SAScii( NHIS.11.personsx.SAS.read.in.instructions )
## End(Not run)



