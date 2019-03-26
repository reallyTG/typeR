library(taxize)


### Name: synonyms
### Title: Retrieve synonyms from various sources given input taxonomic
###   names or identifiers
### Aliases: synonyms synonyms.default synonyms.tsn synonyms.colid
###   synonyms.tpsid synonyms.nbnid synonyms.wormsid synonyms.iucn
###   synonyms.ids synonyms_df

### ** Examples

## Not run: 
##D # Plug in taxon IDs
##D synonyms(183327, db="itis")
##D synonyms("25509881", db="tropicos")
##D synonyms("NBNSYS0000004629", db='nbn')
##D # synonyms("87e986b0873f648711900866fa8abde7", db='col') # FIXME
##D synonyms(105706, db='worms')
##D synonyms(12392, db='iucn')
##D 
##D # Plug in taxon names directly
##D synonyms("Pinus contorta", db="itis")
##D synonyms("Puma concolor", db="itis")
##D synonyms(c("Poa annua",'Pinus contorta','Puma concolor'), db="itis")
##D synonyms("Poa annua", db="tropicos")
##D synonyms("Pinus contorta", db="tropicos")
##D synonyms(c("Poa annua",'Pinus contorta'), db="tropicos")
##D synonyms("Pinus sylvestris", db='nbn')
##D synonyms("Puma concolor", db='col')
##D synonyms("Ursus americanus", db='col')
##D synonyms("Amblyomma rotundatum", db='col')
##D synonyms('Pomatomus', db='worms')
##D synonyms('Pomatomus saltatrix', db='worms')
##D 
##D # not accepted names, with ITIS
##D ## looks for whether the name given is an accepted name,
##D ## and if not, uses the accepted name to look for synonyms
##D synonyms("Acer drummondii", db="itis")
##D synonyms("Spinus pinus", db="itis")
##D 
##D # Use get_* methods
##D synonyms(get_tsn("Poa annua"))
##D synonyms(get_tpsid("Poa annua"))
##D synonyms(get_nbnid("Carcharodon carcharias"))
##D synonyms(get_colid("Ornithodoros lagophilus"))
##D synonyms(get_iucn('Loxodonta africana'))
##D 
##D # Pass many ids from class "ids"
##D out <- get_ids(names="Poa annua", db = c('itis','tropicos'))
##D synonyms(out)
##D 
##D # Use the rows parameter to select certain rows
##D synonyms("Poa annua", db='tropicos', rows=1)
##D synonyms("Poa annua", db='tropicos', rows=1:3)
##D synonyms("Pinus sylvestris", db='nbn', rows=1:3)
##D synonyms("Amblyomma rotundatum", db='col', rows=2)
##D synonyms("Amblyomma rotundatum", db='col', rows=2:3)
##D 
##D # Use curl options
##D synonyms("Poa annua", db='tropicos', rows=1, config=verbose())
##D synonyms("Poa annua", db='itis', rows=1, config=verbose())
##D synonyms("Poa annua", db='col', rows=1, config=verbose())
##D 
##D 
##D # combine many outputs together
##D x <- synonyms(c("Osmia bicornis", "Osmia rufa", "Osmia"), db = "itis")
##D synonyms_df(x)
##D 
##D ## note here how Pinus contorta is dropped due to no synonyms found
##D x <- synonyms(c("Poa annua",'Pinus contorta','Puma concolor'), db="col")
##D synonyms_df(x)
##D 
##D ## note here that ids are taxon identifiers b/c you start with them
##D x <- synonyms(c(25509881, 13100094), db="tropicos")
##D synonyms_df(x)
##D 
##D ## NBN
##D x <- synonyms(c('Aglais io', 'Usnea hirta', 'Arctostaphylos uva-ursi'),
##D   db="nbn")
##D synonyms_df(x)
## End(Not run)



