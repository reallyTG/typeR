library(MGRASTer)


### Name: call.MGRAST
### Title: Interface to MG-RAST API
### Aliases: call.MGRAST parse.MGRAST

### ** Examples

## Not run: 
##D ##  The calls below are adapted from the MG-RAST API documentation pages.
##D ##  An example is provided for most resource types.
##D ##  Note that resources are returned invisibly by call.MGRAST().
##D ##  These examples are "not run" because they take too long.
##D 
##D ##
##D ##  Use of call.MGRAST(), parse.MGRAST(), and do.call() together
##D 
##D parse.MGRAST ("http://api.metagenomics.anl.gov/download/mgm4447943.3?stage=650")
##D ll <- list (id=4447943.3, stage=650)
##D call.MGRAST ("down", "set", args=ll)
##D 
##D print (tt <- tempfile())
##D parse.MGRAST ("http://api.metagenomics.anl.gov/download/mgm4447943.3?file=350.1")
##D call.MGRAST ("down", "inst", id=4447943.3, file=350.1, destfile=tt)
##D parse.MGRAST (call.MGRAST (issue=FALSE, "down", "inst", id=4447943.3, file=350.1, 
##D 	destfile=tt))
##D unlink (tt)
##D 
##D parse.MGRAST ("http://api.metagenomics.anl.gov/library?limit=20&order=name")
##D call.MGRAST ("lib", "query", lim=20, ord="name")
##D do.call (call.MGRAST, 
##D 	parse.MGRAST ("http://api.metagenomics.anl.gov/library?limit=20&order=name"))
##D 
##D ##
##D ##  accessing the "m5nr" resource
##D 
##D call.MGRAST ("m5", "ont", source="Sub", min="level3")
##D call.MGRAST ("m5", "tax", filter="Bacteroidetes", filter_lev="phylum", min="genus")
##D call.MGRAST ("m5", "md5", id="000821a2e2f63df1a3873e4b280002a8", source="InterPro")
##D call.MGRAST ("m5", "func", text="sulfatase", source="GenBank")
##D call.MGRAST ("m5", "seq", text="MAGENHQWQGSIL", source="TrEMBL")
##D 
##D ##
##D ##  parsing URLs for the calls above
##D 
##D parse.MGRAST (
##D 	"http://api.metagenomics.anl.gov/m5nr/ontology?source=Subsystems&min_level=level3")
##D parse.MGRAST (paste0 ("http://api.metagenomics.anl.gov/m5nr/taxonomy",
##D 	"?filter=Bacteroidetes&filter_level=phylum&min_level=genus"))
##D parse.MGRAST (paste0 ("http://api.metagenomics.anl.gov/m5nr/md5/",
##D 	"000821a2e2f63df1a3873e4b280002a8?source=InterPro"))
##D parse.MGRAST ("http://api.metagenomics.anl.gov/m5nr/function/sulfatase?source=GenBank")
##D parse.MGRAST (
##D 	"http://api.metagenomics.anl.gov/m5nr/sequence/MAGENHQWQGSIL?source=TrEMBL")
##D 
##D ##
##D ##  annotation data via the "matrix" resource,
##D ##  and different ways to provide arguments
##D 
##D xx <- c (4447943.3, 4447192.3, 4447102.3, 4447103.3)
##D yy <- "4447943.3 4447192.3 4447102.3 4447103.3"
##D aa <- list (group="level3", source="Sub", res="ab", ident=80, 
##D 	filter_lev="phylum", filter="Firmicutes")
##D call.MGRAST ("matrix", "org", id=xx, group="family", source="Ref", result="abund", eval=15)
##D call.MGRAST ("matrix", "func", id=xx, args=aa)
##D call.MGRAST ("matrix", "feat", id=yy, source="KEGG", result="ev", len=25)
##D 
##D ##
##D ##  parsing URLs for the calls above
##D 
##D parse.MGRAST (paste0 (
##D 	"http://api.metagenomics.anl.gov/matrix/organism",
##D 	"?id=mgm4447943.3&id=mgm4447192.3&id=mgm4447102.3&id=mgm4447103.3",
##D 	"&group_level=family&source=RefSeq&result_type=abundance&evalue=15"))
##D parse.MGRAST (paste0 (
##D 	"http://api.metagenomics.anl.gov/matrix/function",
##D 	"?id=mgm4447943.3&id=mgm4447192.3&id=mgm4447102.3&id=mgm4447103.3",
##D 	"&group_level=level3&source=Subsystems&result_type=abundance&identity=80",
##D 	"&filter_level=phylum&filter=Firmicutes"))
##D parse.MGRAST (paste0 (
##D 	"http://api.metagenomics.anl.gov/matrix/feature",
##D 	"?id=mgm4447943.3&id=mgm4447192.3&id=mgm4447102.3&id=mgm4447103.3",
##D 	"&source=KEGG&result_type=evalue&length=25"))
##D 
##D ##
##D ##  examples for still other resources
##D 
##D parse.MGRAST ("http://api.metagenomics.anl.gov/metadata/export/mgp128")
##D call.MGRAST ("metadata", "exp", id=128)
##D 
##D parse.MGRAST (
##D 	"http://api.metagenomics.anl.gov/metagenome/mgm4447943.3?verbosity=metadata")
##D call.MGRAST ("metagenome","inst", id=4447943.3, verb="meta")
##D 
##D parse.MGRAST ("http://api.metagenomics.anl.gov/project?limit=20&order=name")
##D call.MGRAST ("proj", "query", lim=20, ord="name")
##D 
##D parse.MGRAST ("http://api.metagenomics.anl.gov/sample/mgs25823?verbosity=full")
##D call.MGRAST ("samp", "inst", id=25823, verb="full")
##D 
##D ##
##D ##  finally, examples for annotation downloads (they take substantial time)
##D 
##D print (tt <- tempfile())
##D call.MGRAST ("annot", "seq", id=4447943.3, eval=10, type="org", source="Swiss",
##D 	destfile=tt)
##D call.MGRAST ("annot", "sim", id=4447943.3, ident=80, type="fu", source="KO", 
##D 	destfile=tt)
##D unlink (tt)
## End(Not run)



