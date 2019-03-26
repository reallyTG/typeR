library(GOplot)


### Name: GOChord
### Title: Displays the relationship between genes and terms.
### Aliases: GOChord

### ** Examples

## Not run: 
##D # Load the included dataset
##D data(EC)
##D 
##D # Generating the binary matrix
##D chord<-chord_dat(circ,EC$genes,EC$process)
##D 
##D # Creating the chord plot
##D GOChord(chord)
##D 
##D # Excluding process with less than 5 assigned genes
##D GOChord(chord, limit = c(0,5))
##D 
##D # Creating the chord plot genes ordered by logFC and a different logFC color scale
##D GOChord(chord,space=0.02,gene.order='logFC',lfc.col=c('red','black','cyan'))
## End(Not run)



