library(reutils)


### Name: efetch
### Title: efetch - downloading full records
### Aliases: efetch

### ** Examples

## Not run: 
##D ## From Protein, retrieve a raw GenPept record and write it to a file.
##D p <- efetch("195055", "protein", "gp")
##D p
##D 
##D write(content(p, "text"), file = "~/AAD15290.gp")
##D 
##D ## Get accessions for a list of GenBank IDs (GIs)
##D acc <- efetch(c("1621261", "89318838", "68536103", "20807972", "730439"),
##D               "protein", rettype = "acc")
##D acc
##D acc <- strsplit(content(acc), "\n")[[1]]
##D acc
##D 
##D ## Get GIs from a list of accession numbers
##D gi <- efetch(c("CAB02640.1", "EAS10332.1", "YP_250808.1", "NP_623143.1", "P41007.1"),
##D              "protein", "uilist")
##D gi
##D 
##D ## we can conveniently extract the UIDs using the eutil method #xmlValue(xpath)
##D gi$xmlValue("/IdList/Id")
##D 
##D ## or we can extract the contents of the efetch query using the fuction content()
##D ## and use the XML package to retrieve the UIDs
##D doc <- content(gi)
##D XML::xpathSApply(doc, "/IdList/Id", XML::xmlValue)
##D 
##D ## Get the scientific name for an organism starting with the NCBI taxon id.
##D tx <- efetch("527031", "taxonomy")
##D tx
##D  
##D ## Convenience accessor for XML nodes of interest using XPath
##D ## Extract the TaxIds of the Lineage
##D tx["//LineageEx/Taxon/TaxId"]
##D 
##D ## Use an XPath expession to extract the scientific name.
##D tx$xmlValue("/TaxaSet/Taxon/ScientificName")
##D 
##D ## Iteratively retrieve a large number of records
##D # First store approx. 8400 UIDs on the History server.
##D uid <- esearch(term = "hexokinase", db = 'protein', usehistory = TRUE)
##D # Fetch the records and write to file in batches of 500.
##D efetch(uid, rettype = "fasta", retmode = "text", outfile = "~/tmp/hexokinases.fna")
##D 
## End(Not run)



