library(SeqKat)


### Name: seqkat
### Title: SeqKat
### Aliases: seqkat

### ** Examples

example.bed.file <- paste0(
	path.package("SeqKat"),
	"/extdata/test/PD4120a-chr4-1-2000000_test_snvs.bed"
	);
example.ref.dir <- paste0(
	path.package("SeqKat"),
	"/extdata/test/ref/"
	);
example.chromosome.length.file <- paste0(
	path.package("SeqKat"),
	"/extdata/test/length_hg19_chr_test.txt"
	);
seqkat(
	5,
	3.2,
	2,
	bed.file = example.bed.file,
	output.dir = tempdir(),
	chromosome = "4",
	ref.dir = example.ref.dir,
	chromosome.length.file = example.chromosome.length.file
	);



