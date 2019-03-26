library(SeqKat)


### Name: get.exprobntcx
### Title: get.exprobntcx
### Aliases: get.exprobntcx

### ** Examples

load(
	paste0(
		path.package("SeqKat"),
		"/extdata/test/somatic.rda"
		)
	);

trinucleotide.count.file <- paste0(
	path.package("SeqKat"),
	"/extdata/tn_count.txt"
	);

example.ref.dir <- paste0(
	path.package("SeqKat"),
	"/extdata/test/ref/"
	);

get.exprobntcx(somatic, example.ref.dir, trinucleotide.count.file)



