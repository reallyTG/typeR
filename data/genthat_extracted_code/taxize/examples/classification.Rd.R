library(taxize)


### Name: classification
### Title: Retrieve the taxonomic hierarchy for a given taxon ID.
### Aliases: classification classification.default classification.tsn
###   classification.uid classification.eolid classification.colid
###   classification.tpsid classification.gbifid classification.nbnid
###   classification.tolid classification.wormsid classification.natservid
###   classification.boldid classification.wiki classification.ids
###   cbind.classification rbind.classification cbind.classification_ids
###   rbind.classification_ids

### ** Examples

## Not run: 
##D # Plug in taxon IDs
##D classification(9606, db = 'ncbi')
##D classification(c(9606, 55062), db = 'ncbi')
##D classification(129313, db = 'itis')
##D classification(57361017, db = 'eol')
##D classification(126436, db = 'worms')
##D classification("ELEMENT_GLOBAL.2.134717", db = 'natserv')
##D classification(c(2704179, 2441176), db = 'gbif')
##D classification(25509881, db = 'tropicos')
##D classification("NBNSYS0000004786", db = 'nbn')
##D classification(as.nbnid("NBNSYS0000004786"), db = 'nbn')
##D classification(3930798, db = 'tol')
##D 
##D ## works the same if IDs are in class character
##D classification(c("2704179", "2441176"), db = 'gbif')
##D classification("Agapostemon", db = "bold")
##D 
##D # wikispecies
##D classification("Malus domestica", db = "wiki")
##D classification("Pinus contorta", db = "wiki")
##D classification("Pinus contorta", db = "wiki", wiki_site = "commons")
##D classification("Pinus contorta", db = "wiki", wiki_site = "pedia")
##D classification("Pinus contorta", db = "wiki", wiki_site = "pedia", wiki = "fr")
##D 
##D classification(get_wiki("Malus domestica", "commons"))
##D classification(get_wiki("Malus domestica", "species"))
##D classification(c("Pinus contorta", "Malus domestica"), db = "wiki")
##D 
##D # Plug in taxon names
##D ## in this case, we use get_*() fxns internally to first get taxon IDs
##D classification(c("Chironomus riparius", "aaa vva"), db = 'ncbi')
##D classification(c("Chironomus riparius", "aaa vva"), db = 'ncbi',
##D   messages=FALSE)
##D classification(c("Chironomus riparius", "aaa vva"), db = 'itis')
##D classification(c("Chironomus riparius", "aaa vva"), db = 'itis',
##D   messages=FALSE)
##D classification(c("Chironomus riparius", "aaa vva"), db = 'eol')
##D classification(c("Chironomus riparius", "aaa vva"), db = 'col')
##D classification("Alopias vulpinus", db = 'nbn')
##D classification('Gadus morhua', db = 'worms')
##D classification('Aquila chrysaetos', db = 'natserv')
##D classification('Gadus morhua', db = 'natserv')
##D classification('Pomatomus saltatrix', db = 'natserv')
##D classification('Aquila chrysaetos', db = 'natserv')
##D classification(c("Chironomus riparius", "aaa vva"), db = 'col',
##D   messages=FALSE)
##D classification(c("Chironomus riparius", "asdfasdfsfdfsd"), db = 'gbif')
##D classification("Chironomus", db = 'tol')
##D classification("Poa annua", db = 'tropicos')
##D 
##D # Use methods for get_uid, get_tsn, get_eolid, get_colid, get_tpsid
##D classification(get_uid(c("Chironomus riparius", "Puma concolor")))
##D 
##D classification(get_uid(c("Chironomus riparius", "aaa vva")))
##D classification(get_tsn(c("Chironomus riparius", "aaa vva")))
##D classification(get_tsn(c("Chironomus riparius", "aaa vva"),
##D   messages = FALSE))
##D classification(get_eolid(c("Chironomus riparius", "aaa vva")))
##D classification(get_colid(c("Chironomus riparius", "aaa vva")))
##D classification(get_tpsid(c("Poa annua", "aaa vva")))
##D classification(get_gbifid(c("Poa annua", "Bison bison")))
##D 
##D # Pass many ids from class "ids"
##D (out <- get_ids(names="Puma concolor", db = c('ncbi','gbif')))
##D (cl <- classification(out))
##D 
##D # Bind width-wise from class classification_ids
##D cbind(cl)
##D 
##D # Bind length-wise
##D rbind(cl)
##D 
##D # Many names to get_ids
##D (out <- get_ids(names=c("Puma concolor","Accipiter striatus"),
##D   db = c('ncbi','itis','col')))
##D (cl <- classification(out))
##D rbind(cl)
##D ## cbind with so many names results in some messy data
##D cbind(cl)
##D ## so you can turn off return_id
##D cbind( classification(out, return_id=FALSE) )
##D 
##D # rbind and cbind on class classification (from a
##D # call to get_colid, get_tsn, etc. other than get_ids)
##D (cl_col <- classification(
##D   get_colid(c("Puma concolor","Accipiter striatus"))))
##D rbind(cl_col)
##D cbind(cl_col)
##D 
##D (cl_uid <- classification(get_uid(c("Puma concolor","Accipiter striatus")),
##D   return_id=FALSE))
##D rbind(cl_uid)
##D cbind(cl_uid)
##D ## cbind works a bit odd when there are lots of ranks without names
##D (cl_uid <- classification(get_uid(c("Puma concolor","Accipiter striatus")),
##D   return_id=TRUE))
##D cbind(cl_uid)
##D 
##D (cl_tsn <- classification(get_tsn(c("Puma concolor","Accipiter striatus"))))
##D rbind(cl_tsn)
##D cbind(cl_tsn)
##D 
##D (tsns <- get_tsn(c("Puma concolor","Accipiter striatus")))
##D (cl_tsns <- classification(tsns))
##D cbind(cl_tsns)
##D 
##D # NBN data
##D (res <- classification(c("Alopias vulpinus","Pinus sylvestris"),
##D   db = 'nbn'))
##D rbind(res)
##D cbind(res)
##D 
##D # Return taxonomic IDs
##D ## the return_id parameter is logical, and you can turn it on or off.
##D ## It's TRUE by default
##D classification(c("Alopias vulpinus","Pinus sylvestris"), db = 'ncbi',
##D   return_id = TRUE)
##D classification(c("Alopias vulpinus","Pinus sylvestris"), db = 'ncbi',
##D   return_id = FALSE)
##D 
##D # Use rows parameter to select certain
##D classification('Poa annua', db = 'tropicos')
##D classification('Poa annua', db = 'tropicos', rows=1:4)
##D classification('Poa annua', db = 'tropicos', rows=1)
##D classification('Poa annua', db = 'tropicos', rows=6)
## End(Not run)

## Not run: 
##D # Fails without db param set
##D # classification(315576)
## End(Not run)



