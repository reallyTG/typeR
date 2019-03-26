library(EcoHydRology)


### Name: setup_swatcal
### Title: A function to setup a swat calibration
### Aliases: setup_swatcal

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(change_params){
library(operators)
for(ft in unique(change_params$filetype)){
        print(ft)
        files=list.files(,paste(ft,"$",sep=""))
        for (file in files) {
                junk%<%file
                junk=gsub("\r","",junk)
                file_swatcal=paste(file,".unixorig",sep="");
                cat(junk,file=file_swatcal,sep="\n")
        }
  }
  }



