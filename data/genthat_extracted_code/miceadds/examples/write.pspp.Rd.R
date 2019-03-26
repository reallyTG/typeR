library(miceadds)


### Name: write.pspp
### Title: Writing a Data Frame into SPSS Format Using PSPP Software
### Aliases: write.pspp
### Keywords: Utility function PSPP (SPSS)

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Write a data frame into SPSS format
##D #############################################################################
##D 
##D #****
##D # (1) define data frame
##D data <- data.frame( "pid"=1000+1:5, "height"=round(rnorm( 5 ),4),
##D                 "y"=10*c(1,1,1,2,2), "r2"=round( rnorm(5),2),
##D                 "land"=as.factor( c( rep("A",1), rep("B", 4 ) ) ) )
##D #****
##D # (2) define variable labels
##D v1 <- rep( "", ncol(data) )
##D names(v1) <-  colnames(data)
##D attr( data, "variable.labels" ) <- v1
##D attr(data,"variable.labels")["pid"] <- "Person ID"
##D attr(data,"variable.labels")["height"] <- "Height of a person"
##D attr(data,"variable.labels")["y"] <- "Gender"
##D 
##D #****
##D # (3) define some value labels
##D v1 <- c(10,20)
##D names(v1) <- c("male", "female" )
##D attr( data$y, "value.labels" ) <- v1
##D 
##D #****
##D # (4a) run PSPP to produce a sav file
##D write.pspp( data, datafile="example_data1",
##D         pspp.path="C:/Program Files (x86)/PSPP/bin/" )
##D 
##D #****
##D # (4b) produce strings instead of factors
##D write.pspp( data, datafile="example_data2",
##D         pspp.path="C:/Program Files (x86)/PSPP/bin/", as.factors=FALSE )
##D 
##D #****
##D # write sav file using haven package
##D library(haven)
##D haven::write_sav( data, "example_data1a.sav" )
##D 
##D #****
##D # write sav file using sjlabelled package
##D library(sjlabelled)
##D data <- sjlabelled::set_label( data, attr(data, "variable.labels") )
##D sjlabelled::write_spss( data, "example_data1b.sav" )
## End(Not run)



