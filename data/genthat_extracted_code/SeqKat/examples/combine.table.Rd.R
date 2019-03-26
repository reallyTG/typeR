library(SeqKat)


### Name: combine.table
### Title: Combine Table
### Aliases: combine.table

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
		"/extdata/test/final.score.rda"
		)
	);

combine.table(
	final.score,
	somatic,
	3.2,
	4,
	tempdir()
	);



