library(SeqKat)


### Name: final.score
### Title: Final Score
### Aliases: final.score

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
		"/extdata/test/test.table.rda"
		)
	);

final.score(
	test.table,
	5,
	somatic,
	tempdir()
	);



