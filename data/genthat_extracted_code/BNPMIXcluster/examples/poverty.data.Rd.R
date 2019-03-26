library(BNPMIXcluster)


### Name: poverty.data
### Title: Poverty data for testing the _BNPMIXcluster_ package
### Aliases: poverty.data

### ** Examples


##### Generates poverty.data using the original data from CONEVAL's website #####

## Not run: 
##D # step 1:
##D #     Download and unzip the file "R_2014.zip"
##D #     available in:
##D #     http://www.coneval.org.mx/Medicion/MP/Documents/Programas_calculo_pobreza_10_12_14/R_2014.zip
##D 
##D # step 2:
##D #     extract and read the csv file "pobreza_14.csv"
##D 
##D coneval.poverty.data <- read.csv("pobreza_14.csv", na.strings=c("NA",""))
##D 
##D # step 3:
##D #     Execute the following code...
##D 
##D var_id <- c("proyecto","folioviv","foliohog","numren")
##D for(i in match(var_id,colnames(coneval.poverty.data)) ){
##D      coneval.poverty.data[,i] <- formatC( x=as.numeric(coneval.poverty.data[,i]),
##D                                           width=max(nchar(coneval.poverty.data[,i])),
##D                                           format="f",flag="0",digits=0
##D                                           )
##D }
##D 
##D # normalizing the continuous variable for income #
##D b <- quantile(coneval.poverty.data$ict,probs=0.01)
##D coneval.poverty.data$ict_norm <- log(coneval.poverty.data$ict+b)
##D 
##D # Aggregating data at household level
##D Y_names <- c("ict_norm",
##D              "ic_ali","ic_asalud","ic_cv",
##D              "ic_rezedu","ic_sbv","ic_segsoc",
##D              "niv_ed","tam_loc")
##D agg_form <- as.formula( paste( "cbind(",paste(c(Y_names,"factor_hog"),collapse=",") ,")",
##D                                "~proyecto+folioviv+foliohog"
##D                              )
##D                       )
##D 
##D poverty.data <- aggregate(agg_form,FUN="max",data=coneval.poverty.data)
##D 
## End(Not run)




