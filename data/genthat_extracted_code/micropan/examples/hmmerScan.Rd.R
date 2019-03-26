library(micropan)


### Name: hmmerScan
### Title: Scanning a profile Hidden Markov Model database
### Aliases: hmmerScan

### ** Examples

## Not run: 
##D # This example requires the external HMMER software
##D # Using two files in the micropan package
##D xpth <- file.path(path.package("micropan"),"extdata")
##D prot.file <- file.path(xpth,"Example_proteins_GID1.fasta.xz")
##D db <- "microfam.hmm"
##D db.files <- file.path(xpth,paste(db,c(".h3f.xz",".h3i.xz",".h3m.xz",".h3p.xz"),sep=""))
##D 
##D # We need to uncompress them first...
##D prot.tf <- tempfile(pattern="GID1.fasta",fileext=".xz")
##D s <- file.copy(prot.file,prot.tf)
##D prot.tf <- xzuncompress(prot.tf)
##D db.tf <- paste(tempfile(),c(".h3f.xz",".h3i.xz",".h3m.xz",".h3p.xz"),sep="")
##D s <- file.copy(db.files,db.tf)
##D db.tf <- unlist(lapply(db.tf,xzuncompress))
##D db.name <- gsub("\\",.Platform$file.sep,sub(".h3f$","",db.tf[1]),fixed=T)
##D 
##D # Scanning the FASTA-file against microfam0...
##D tmp.dir <- tempdir()
##D hmmerScan(in.files=prot.tf,db=db.name,out.folder=tmp.dir)
##D 
##D # Reading results
##D db.nm <- rev(unlist(strsplit(db.name,split=.Platform$file.sep)))[1]
##D hmm.file <- file.path(tmp.dir,paste("GID1_vs_",db.nm,".txt",sep=""))
##D hmm.tab <- readHmmer(hmm.file)
##D 
##D # ...and cleaning...
##D s <- file.remove(prot.tf)
##D s <- file.remove(sub(".xz","",db.tf))
##D s <- file.remove(hmm.file)
## End(Not run)




