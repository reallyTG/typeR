library(SeqKat)


### Name: get.nucleotide.chunk.counts
### Title: Get Nucleotide Chunk Counts
### Aliases: get.nucleotide.chunk.counts

### ** Examples

example.ref.dir <- paste0(
	path.package("SeqKat"),
	"/extdata/test/ref/"
	);

bases.raw <- c('A','C','G','T','N');
tri.types.raw <- c(
	outer(
		c(outer(bases.raw, bases.raw, function(x, y) paste0(x,y))),
		bases.raw, function(x, y) paste0(x,y))
	);
tri.types.raw <- sort(tri.types.raw);
get.nucleotide.chunk.counts(
	tri.types.raw,
	file.path(example.ref.dir, 'chr4.fa'),
	upstream = 1,
	downstream = 1,
	start = 1,
	end = -1
	);



