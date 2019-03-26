library(ProfessR)


### Name: IDandEM
### Title: Match ID and Email file
### Aliases: IDandEM
### Keywords: misc

### ** Examples


## Not run: 
##D ##  read in the names of the files
##D zfile = scan(file="ALLIDS", list(name="", ID=0, tfile=""), sep="," )
##D ##  read in a roster.  The roster has
##D ##   email addresses that are attached tot he files
##D ##  by matching the ID in the zfile with the IDs in the data base
##D load(file="/home/lees/Class/GEOL_105/Grades_2008/EXAM1/BB1.RDATA")
##D 
##D jroster = BB1
##D 
##D IDandEM(zfile, jroster, sel=1:10, hnote="GEOL105 EXAM3 Results", SEND=FALSE )
##D IDandEM(zfile, jroster,  hnote="GEOL105 EXAM3 Results", SEND=FALSE )
##D 
##D ######## actual sending
##D IDandEM(zfile, jroster, hnote="GEOL105 EXAM3 Results", SEND=TRUE )
##D 
##D 
##D 
## End(Not run)







