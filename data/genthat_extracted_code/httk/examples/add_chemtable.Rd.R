library(httk)


### Name: add_chemtable
### Title: Add a table of chemical information for use in making httk
###   predictions.
### Aliases: add_chemtable

### ** Examples

my.new.data <- as.data.frame(c("A","B","C"),stringsAsFactors=FALSE)
my.new.data <- cbind(my.new.data,as.data.frame(c("111-11-2","222-22-0","333-33-5"),
                     stringsAsFactors=FALSE))
my.new.data <- cbind(my.new.data,as.data.frame(c(200,200,200)))
my.new.data <- cbind(my.new.data,as.data.frame(c(2,3,4)))
my.new.data <- cbind(my.new.data,as.data.frame(c(0.01,0.02,0.3)))
my.new.data <- cbind(my.new.data,as.data.frame(c(0,10,100)))
colnames(my.new.data) <- c("Name","CASRN","MW","LogP","Fup","CLint")

chem.physical_and_invitro.data <- add_chemtable(my.new.data,
                                  current.table=chem.physical_and_invitro.data,
                                  data.list=list(
                                  Compound="Name",
                                  CAS="CASRN",
                                  MW="MW",
                                  logP="LogP",
                                  Funbound.plasma="Fup",
                                  Clint="CLint"),
                                  species="Human",
                                  reference="MyPaper 2015")
parameterize_steadystate(chem.name="C")  
calc_css(chem.name="B")                                



