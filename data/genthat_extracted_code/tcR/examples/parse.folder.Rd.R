library(tcR)


### Name: parse.folder
### Title: Parse input table files with immune receptor repertoire data.
### Aliases: parse.folder parse.file.list parse.file parse.mitcr
###   parse.mitcrbc parse.migec parse.vdjtools parse.immunoseq
###   parse.immunoseq2 parse.immunoseq3 parse.tcr parse.mixcr parse.imseq
###   parse.migmap

### ** Examples

## Not run: 
##D # Parse file in "~/mitcr/immdata1.txt" as a MiTCR file.
##D immdata1 <- parse.file("~/mitcr/immdata1.txt", 'mitcr')
##D # Parse VDJtools file archive as .gz file.
##D immdata1 <- parse.file("~/mitcr/immdata3.txt.gz", 'vdjtools')
##D # Parse files "~/data/immdata1.txt" and "~/data/immdat2.txt" as MiGEC files.
##D immdata12 <- parse.file.list(c("~/data/immdata1.txt",
##D                              "~/data/immdata2.txt"), 'migec')
##D # Parse all files in "~/data/" as MiGEC files.
##D immdata <- parse.folder("~/data/", 'migec')
## End(Not run)



