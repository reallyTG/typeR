library(REDCapR)


### Name: redcap_write
### Title: Write/Import records to a REDCap project.
### Aliases: redcap_write

### ** Examples

## Not run: 
##D #Define some constants
##D uri           <- "https://bbmc.ouhsc.edu/redcap/api/"
##D token         <- "D70F9ACD1EDD6F151C6EA78683944E98"
##D 
##D # Read the dataset for the first time.
##D result_read1  <- redcap_read_oneshot(redcap_uri=uri, token=token)
##D ds1           <- result_read1$data
##D ds1$telephone
##D # The line above returns something like this (depending on its previous state).
##D # [1] "(432) 456-4848" "(234) 234-2343" "(433) 435-9865" "(987) 654-3210" "(333) 333-4444"
##D 
##D # Manipulate a field in the dataset in a VALID way
##D ds1$telephone <- sprintf("(405) 321-%1$i%1$i%1$i%1$i", seq_len(nrow(ds1)))
##D 
##D ds1 <- ds1[1:3, ]
##D ds1$age       <- NULL; ds1$bmi <- NULL #Drop the calculated fields before writing.
##D result_write  <- REDCapR::redcap_write(ds=ds1, redcap_uri=uri, token=token)
##D 
##D # Read the dataset for the second time.
##D result_read2  <- redcap_read_oneshot(redcap_uri=uri, token=token)
##D ds2           <- result_read2$data
##D ds2$telephone
##D # The line above returns something like this.  Notice only the first three lines changed.
##D # [1] "(405) 321-1111" "(405) 321-2222" "(405) 321-3333" "(987) 654-3210" "(333) 333-4444"
##D 
##D # Manipulate a field in the dataset in an INVALID way.  A US exchange can't be '111'.
##D ds1$telephone <- sprintf("(405) 111-%1$i%1$i%1$i%1$i", seq_len(nrow(ds1)))
##D 
##D # This next line will throw an error.
##D result_write <- REDCapR::redcap_write(ds=ds1, redcap_uri=uri, token=token)
##D result_write$raw_text
## End(Not run)



