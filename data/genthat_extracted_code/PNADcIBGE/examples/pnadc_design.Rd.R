library(PNADcIBGE)


### Name: pnadc_design
### Title: Create pnadc survey object utilizing its sampling design for
###   analysis with survey package
### Aliases: pnadc_design

### ** Examples


#Using data read from disk
input_path <- pnadc_example("input_example.txt")
data_path <- pnadc_example("exampledata.txt")
pnadc.df <- read_pnadc(data_path, input_path, vars="VD4002")
dictionary.path <- pnadc_example("dictionaryexample.xls")
pnadc.df <- pnadc_labeller(pnadc.df,dictionary.path)
## Not run: 
##D pnadc.svy <- pnadc_design(pnadc.df)
##D #Calculating unemployment rate
##D survey::svymean(~VD4002, pnadc.svy, na.rm=TRUE)
## End(Not run)

#Downloading data
## Not run: 
##D pnadc.df2<- get_pnadc(2,2017,vars="VD4002")
##D pnadc.df2 <- pnadc_labeller(pnadc.df2,dictionary.path)
##D pnadc.svy2 <- pnadc_design(pnadc.df2)
##D #Calculating unemployment rate
##D survey::svymean(~VD4002, pnadc.svy2, na.rm=TRUE)
## End(Not run)



