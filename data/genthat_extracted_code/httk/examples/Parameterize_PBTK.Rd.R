library(httk)


### Name: parameterize_pbtk
### Title: Parameterize_PBTK
### Aliases: parameterize_pbtk
### Keywords: Parameter

### ** Examples


 parameters <- parameterize_pbtk(chem.cas='80-05-7')

 parameters <- parameterize_pbtk(chem.name='Bisphenol-A',species='Rat')

 # Change the tissue lumping (note, these model parameters will not work with our current solver):
 compartments <- list(liver=c("liver"),fast=c("heart","brain","muscle","kidney"),
                      lung=c("lung"),gut=c("gut"),slow=c("bone"))
 parameterize_pbtk(chem.name="Bisphenol a",species="Rat",default.to.human=TRUE,
                   tissuelist=compartments) 
 
 



