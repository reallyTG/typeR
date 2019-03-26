library(memisc)


### Name: Iconv
### Title: Convert Annotations, and Value Labels between Encodings
### Aliases: Iconv Iconv.annotation Iconv.data.set Iconv.importer
###   Iconv.item Iconv.value.labels
### Keywords: misc

### ** Examples

## Not run: 
##D # Locate an SPSS 'system' file and get info on variables, their labels etc.
##D ZA5302 <- spss.system.file("Daten/ZA5302_v6-0-0.sav",to.lower=FALSE)
##D 
##D # Convert labels etc. from 'latin1' to the encoding of the current locale.
##D ZA5302 <- Iconv(ZA5302,from="latin1")
##D 
##D # Write out the codebook
##D writeLines(as.character(codebook(ZA5302)),
##D            con="ZA5302-cdbk.txt")
##D 
##D # Write out the description of the varialbes (their 'variable labels')
##D writeLines(as.character(description(ZA5302)),
##D            con="ZA5302-description.txt")
## End(Not run)



