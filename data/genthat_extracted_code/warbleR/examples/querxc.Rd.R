library(warbleR)


### Name: querxc
### Title: Access 'Xeno-Canto' recordings and metadata
### Aliases: querxc

### ** Examples

## Not run: 
##D # Set temporary working directory
##D # setwd(tempdir())
##D 
##D # search without downloading
##D df1 <- querxc(qword = 'Phaethornis anthophilus', download = FALSE)
##D View(df1)
##D 
##D # downloading files
##D querxc(qword = 'Phaethornis anthophilus', download = TRUE)
##D 
##D # check this folder
##D getwd()
##D 
##D ## search using xeno-canto advance query ###
##D orth.pap <- querxc(qword = 'gen:orthonyx cnt:papua loc:tari', download = FALSE)
##D  
##D # download file using the output data frame as input
##D querxc(X = orth.pap)
##D 
##D # use quotes for queries with more than 1 word (e.g. Costa Rica),note that the 
##D # single quotes are used for the whole 'qword' and double quotes for the 2-word term inside
##D #Phaeochroa genus in Costa Rica 
##D phae.cr <- querxc(qword = 'gen:phaeochroa cnt:"costa rica"', download = FALSE)
##D 
##D # several terms can be searched for in the same field
##D # search for all female songs in sound type
##D femsong <- querxc(qword = 'type:song type:female', download = FALSE)
## End(Not run)




