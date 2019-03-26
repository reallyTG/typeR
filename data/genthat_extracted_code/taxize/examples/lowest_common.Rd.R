library(taxize)


### Name: lowest_common
### Title: Retrieve the lowest common taxon and rank for a given taxon name
###   or ID
### Aliases: lowest_common lowest_common.default lowest_common.uid
###   lowest_common.tsn lowest_common.gbifid lowest_common.colid
###   lowest_common.tolid

### ** Examples

## Not run: 
##D id <- c("9031", "9823", "9606", "9470")
##D id_class <- classification(id, db = 'ncbi')
##D lowest_common(id[2:4], db = "ncbi")
##D lowest_common(id[2:4], db = "ncbi", low_rank = 'class')
##D lowest_common(id[2:4], db = "ncbi", low_rank = 'family')
##D lowest_common(id[2:4], class_list = id_class)
##D lowest_common(id[2:4], class_list = id_class, low_rank = 'class')
##D lowest_common(id[2:4], class_list = id_class, low_rank = 'family')
##D 
##D # COL
##D taxa <- c('Nycticebus coucang', 'Homo sapiens', 'Sus scrofa')
##D cls <- classification(taxa, db = "col")
##D lowest_common(taxa, class_list = cls, db = "col")
##D lowest_common(get_colid(taxa), class_list = cls)
##D xx <- get_colid(taxa)
##D lowest_common(xx, class_list = cls)
##D 
##D # TOL
##D taxa <- c("Angraecum sesquipedale", "Dracula vampira",
##D   "Masdevallia coccinea")
##D (cls <- classification(taxa, db = "tol"))
##D lowest_common(taxa, db = "tol", class_list = cls)
##D lowest_common(get_tolid(taxa), class_list = cls)
##D xx <- get_tolid(taxa)
##D lowest_common(xx, class_list = cls)
##D 
##D spp <- c("Sus scrofa", "Homo sapiens", "Nycticebus coucang")
##D lowest_common(spp, db = "ncbi")
##D lowest_common(get_uid(spp))
##D 
##D lowest_common(spp, db = "itis")
##D lowest_common(get_tsn(spp))
##D 
##D gbifid <- c("2704179", "3119195")
##D lowest_common(gbifid, db = "gbif")
##D 
##D spp <- c("Poa annua", "Helianthus annuus")
##D lowest_common(spp, db = "gbif")
##D lowest_common(get_gbifid(spp))
##D 
##D cool_orchid <- c("Angraecum sesquipedale", "Dracula vampira",
##D   "Masdevallia coccinea")
##D orchid_ncbi <- get_uid(cool_orchid)
##D orchid_gbif <- get_gbifid(cool_orchid)
##D 
##D cool_orchids2 <- c("Domingoa haematochila", "Gymnadenia conopsea",
##D   "Masdevallia coccinea")
##D orchid_itis <- get_tsn(cool_orchids2)
##D 
##D orchid_hier_ncbi <- classification(orchid_ncbi, db = 'ncbi')
##D orchid_hier_gbif <- classification(orchid_gbif, db = 'gbif')
##D orchid_hier_itis <- classification(orchid_itis, db = 'itis')
##D 
##D lowest_common(orchid_ncbi, low_rank = 'class')
##D lowest_common(orchid_ncbi, class_list = orchid_hier_ncbi,
##D   low_rank = 'class')
##D lowest_common(orchid_gbif, low_rank = 'class')
##D lowest_common(orchid_gbif, orchid_hier_gbif, low_rank = 'class')
##D lowest_common(get_uid(cool_orchid), low_rank = 'class')
##D lowest_common(get_uid(cool_orchid), low_rank = 'family')
##D 
##D lowest_common(orchid_ncbi, class_list = orchid_hier_ncbi,
##D   low_rank = 'subfamily')
##D lowest_common(orchid_gbif, class_list = orchid_hier_gbif,
##D   low_rank = 'subfamily')
##D 
##D lowest_common(orchid_itis, class_list = orchid_hier_itis,
##D   low_rank = 'class')
##D 
##D ## Pass in sci. names
##D nms <- c("Angraecum sesquipedale", "Dracula vampira", "Masdevallia coccinea")
##D lowest_common(x = nms, db = "ncbi")
##D lowest_common(x = nms, db = "gbif")
##D # lowest_common(x = nms, db = "itis")
##D 
##D ## NAs due to taxon not found, stops with error message
##D # lowest_common(orchid_itis, db = "itis")
##D # lowest_common(get_tsn(cool_orchid))
## End(Not run)



