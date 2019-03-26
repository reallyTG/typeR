library(SeqKat)


### Name: test.kataegis
### Title: Test Kataegis
### Aliases: test.kataegis

### ** Examples

load(
	paste0(
		path.package("SeqKat"),
		"/extdata/test/somatic.rda"
		)
	);

load(
	paste0(
		path.package("SeqKat"),
		"/extdata/test/exprobntcx.rda"
		)
	);

example.chromosome.length.file <- paste0(
	path.package("SeqKat"),
	"/extdata/test/length_hg19_chr_test.txt"
	);

example.ref.dir <- paste0(
	path.package("SeqKat"),
	"/extdata/test/ref/"
	);

test.kataegis(
	4,
	somatic,
	2,
	exprobntcx,
	tempdir(),
	example.ref.dir,
	example.chromosome.length.file
	);



