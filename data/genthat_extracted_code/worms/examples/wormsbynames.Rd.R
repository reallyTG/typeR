library(worms)


### Name: wormsbynames
### Title: GET AphiaRecordsByNames
### Aliases: wormsbynames

### ** Examples

taxon_names <- c( "Westwodilla caecula" ,  "Abra alba", "Chaetozone cf. setosa",  "Algae" )
w <- wormsbynames(taxon_names)
## print unrecognized returns
failed_species <- rownames(w[is.na(w[,1]),])

## try again with fuzzy matching turned on
## No test: 
w <- wormsbynames(taxon_names, match=TRUE)
## End(No test)

## this is how to load taxon_names from file
write.csv(taxon_names , file = "tax.csv", 
        row.names = FALSE,
        na = "")
## check it out, then load it
read.csv(file = "tax.csv",
        na = "", 
        stringsAsFactors = FALSE,
        col.names = FALSE)
## save results to file to inspect with, e.g. spreadsheet software
write.csv(w,file = "aphiainfo.csv", 
        na = "", 
        col.names = TRUE,
        row.names = TRUE)

        



