library(bedr)


### Name: test.region.similarity
### Title: Compare sets of regions via jaccard and relative distance using
###   permutation
### Aliases: test.region.similarity
### Keywords: permute

### ** Examples


if (check.binary("bedtools")) {

index <- get.example.regions();

a <- index[[1]];
b <- index[[2]];
a <- bedr(engine = "bedtools", input = list(i = a), method = "sort", params = "");
b <- bedr(engine = "bedtools", input = list(i = b), method = "sort", params = "");

# a simple example
test.region.similarity(a, b, n = 8)

# note you can set the cores available to parallelize
options(cores = 4);
system.time(test.region.similarity(a, b, n = 8));

# a real example comparing the distribution of mRNA vs ncRNA genes in RefSeq
## Not run: 
##D 
##D # more core
##D options(cores = 8);
##D 
##D # load refgene
##D refgene <- query.ucsc("refGene")
##D refgene <- refgene[,c("chrom","txStart","txEnd","name","name2","strand")]
##D 
##D # only include canonical chr
##D chr <- paste0("chr", c(1:22,"X","Y")); 
##D refgene <- refgene[refgene$chrom ##D 
##D 
##D # remove genes with multiple positions
##D duplicated.gene <- duplicated(refgene$name2) | duplicated(rev(refgene$name2));
##D refgene <- refgene[!duplicated.gene,];
##D 
##D # only select pr coding genes
##D refgene.nm <- refgene[grepl("^NM",refgene$name),];
##D # only select non protein coding rna genes	
##D refgene.nr <- refgene[grepl("^NR",refgene$name),];
##D 
##D # sort and merge
##D refgene.nm <- bedr.snm.region(refgene.nm,check.chr = FALSE);
##D refgene.nr <- bedr.snm.region(refgene.nr,check.chr = FALSE);
##D 
##D test.region.similarity(refgene.nm, refgene.nr, mask.unmapped = TRUE );
##D 
##D option(core = 1)
## End(Not run)

}




