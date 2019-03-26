library(bedr)


### Name: bedr
### Title: Main bedtools wrapper function.
### Aliases: bedr
### Keywords: bedtools bedops tabix region interval bed

### ** Examples

if (check.binary("bedtools")) {
set.seed(666)

index <- get.example.regions();
a <- index[[1]];
b <- index[[2]];

### check
is.a.valid  <- is.valid.region(a);
is.b.valid  <- is.valid.region(b);
a <- a[is.a.valid];
b <- b[is.b.valid];

### sort
is.sorted <- is.sorted.region(a);
a.sort1 <- bedr(engine = "bedtools", input = list(i = a), method = "sort", params = "");
b.sort1 <- bedr(engine = "bedtools", input = list(i = b), method = "sort", params = "");
a.sort2 <- bedr(engine = "bedops",   input = list(i = a), method = "sort", params = "");

a.sort3 <- bedr.sort.region(a);
a.sort4 <- bedr.sort.region(a, engine = "unix", method = "natural");
a.sort5 <- bedr.sort.region(a, engine = "R", method = "natural");

### merge
is.merged <- is.merged.region(a.sort1);
a.merge1 <- bedr(engine = "bedtools", input = list(i = a.sort1), method = "merge", params = "");
b.merge1 <- bedr(engine = "bedtools", input = list(i = b.sort1), method = "merge", params = "");
a.merge2 <- bedr(engine = "bedops",   input = list(i = a.sort1), method = "merge", params = "");
# a.merge3 <- bedr.merge.region(a); this will throw an error b/c region is not sorted

### subtract
a.sub1 <- bedr(input = list(a = a.merge1, b = b.merge1), method = "subtract", params="");
a.sub2 <- bedr.subtract.region(a.merge1, b.merge1);

### in.region
is.region <- in.region(a.merge1, b.merge1);
#is.region <- a.merge1 %in.region% b.merge1
### intersect 
# note for bedtools its recommended to bedr.sort.regions before intersect for faster processing
# also if regions are not merged this can cause unexpected behaviour
a.int1 <- bedr(input = list(a = a.sort1, b = b.sort1), method = "intersect", params = "-loj");
a.int1 <- bedr(input = list(a = a.sort1, b = b.sort1), method="intersect",params ="-loj -sorted");
a.int2 <- bedr(input = list(a = a.merge1, b = b.merge1), method="intersect",params="-loj -sorted");
a.int3 <- bedr.join.region(a.merge1, b.merge1);

### multiple join
d <- get.random.regions(100, chr="chr1", sort = TRUE);
a.mult <- bedr.join.multiple.region(x = list(a.merge1,b.merge1,bedr.sort.region(d)));

## Not run: 
##D   ### groupby 
##D   # note the "g" column number is based on bed format i.e. first three columns chr, start, stop
##D   # note the use of first, first, last on the region columns i.e. the union of the regions
##D   # note currently missing values are not dealt with in bedtools.  also the 5th column is 
##D   # assumed to be "score" and gets a default "-1" not a "."
##D   cnv.gene <- bedr(
##D     input = list(i=cnv.gene), method = "groupby", params = paste(
##D       "-g 16 -c ", 
##D       paste(1:15, collapse = ","), 
##D       " -o ", "first,first,last, ", 
##D       paste(rep("sum",12), collapse = ","), 
##D       sep = ""
##D       )
##D     );
##D 
##D   ### example 1
##D   ###  workflow adding gene names to exome sequencing target file
##D   # download refseq genes from ucsc or query biomart for ensemble gene names.  
##D   # format them in basic bed format.
##D   # sort, merge target
##D   # sort, merge -nms target.  Overlapping genes/features get merged.  
##D   # this may not be ideal if there are some really big features.
##D   # intersect -loj target, genes.
##D   # alternatively, do not merge the target and apply the merge after the intersect.  
##D   # this will provide precision at the level of the exon.
##D   
## End(Not run)
}



