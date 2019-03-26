library(RMark)


### Name: killdeer
### Title: Killdeer nest survival example data
### Aliases: killdeer
### Keywords: datasets

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
# EXAMPLE CODE FOR CONVERSION OF .INP TO NECESSARY DATA STRUCTURE
# read in killdeer.inp file
#killdeer=scan("killdeer.inp",what="character",sep="\n")
# strip out ; and write out all but first 2 lines which contain comments
#write(sub(";","",killdeer[3:20]),"killdeer.txt")
# read in as a dataframe and assign names
#killdeer=read.table("killdeer.txt")
#names(killdeer)=c("id","FirstFound","LastPresent","LastChecked","Fate","Freq")
#
# EXAMPLE CODE TO RUN MODELS CONTAINED IN THE MARK KILLDEER.DBF
data(killdeer)
# produce summary
summary(killdeer)
# Define function to run models that are in killdeer.dbf
# You must specify either the number of occasions (nocc) or the time.intervals 
# between the occasions.
run.killdeer=function()
{
   Sdot=mark(killdeer,model="Nest",nocc=40)
   STime=mark(killdeer,model="Nest",
       model.parameters=list(S=list(formula=~I(Time+1))),nocc=40,threads=2)
   STimesq=mark(killdeer,model="Nest",
       model.parameters=list(S=list(formula=~I(Time+1)+I((Time+1)^2))),nocc=40,threads=2)
   STime3=mark(killdeer,model="Nest",
      model.parameters=list(S=list(formula=~I(Time+1)+I((Time+1)^2)+I((Time+1)^3))),
                   nocc=40,threads=2)
   return(collect.models())
}
# run defined models
killdeer.results=run.killdeer()
## End(No test)



