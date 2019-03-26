library(traits)


### Name: ncbi_searcher
### Title: Search for gene sequences available for taxa from NCBI.
### Aliases: ncbi_searcher

### ** Examples

## Not run: 
##D # A single species
##D out <- ncbi_searcher(taxa="Umbra limi", seqrange = "1:2000")
##D # Get the same species information using a taxonomy id
##D out <- ncbi_searcher(id = "75935", seqrange = "1:2000")
##D # If the taxon name is unique, using the taxon name and id are equivalent
##D all(ncbi_searcher(id = "75935") ==  ncbi_searcher(taxa="Umbra limi"))
##D # If the taxon name is not unique, use taxon id
##D #  "266948" is the uid for the butterfly genus, but there is also a genus of orchids with the
##D #  same name
##D nrow(ncbi_searcher(id = "266948")) ==  nrow(ncbi_searcher(taxa="Satyrium"))
##D # get list of genes available, removing non-unique
##D unique(out$gene_desc)
##D # does the string 'RAG1' exist in any of the gene names
##D out[grep("RAG1", out$gene_desc, ignore.case=TRUE),]
##D 
##D # A single species without records in NCBI
##D out <- ncbi_searcher(taxa="Sequoia wellingtonia", seqrange="1:2000", getrelated=TRUE)
##D 
##D # Many species, can run in parallel or not using plyr
##D species <- c("Salvelinus alpinus","Ictalurus nebulosus","Carassius auratus")
##D out2 <- ncbi_searcher(taxa=species, seqrange = "1:2000")
##D lapply(out2, head)
##D library("plyr")
##D out2df <- ldply(out2) # make data.frame of all
##D unique(out2df$gene_desc) # get list of genes available, removing non-unique
##D out2df[grep("12S", out2df$gene_desc, ignore.case=TRUE), ]
##D 
##D # Using the getrelated and entrez_query options
##D ncbi_searcher(taxa = "Olpidiopsidales", limit = 5, getrelated = TRUE,
##D             entrez_query = "18S[title] AND 28S[title]")
##D 
##D # get refseqs
##D one <- ncbi_searcher(taxa = "Salmonella enterica", entrez_query="srcdb_refseq[PROP]")
##D two <- ncbi_searcher(taxa = "Salmonella enterica")
## End(Not run)



