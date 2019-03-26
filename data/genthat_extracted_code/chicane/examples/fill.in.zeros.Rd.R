library(chicane)


### Name: fill.in.zeros
### Title: fill.in.zeros
### Aliases: fill.in.zeros fill.in.zeroes

### ** Examples

data(bre80);
	bait.file <- system.file('extdata', '2q35.bed', package = 'chicane');
	fragment.file <- system.file('extdata', 'GRCh38_HindIII_chr2.bed.gz', package = 'chicane');
	results <- fill.in.zeros(
	bre80,
	baits = read.bed(bait.file), 
	fragments = read.bed(fragment.file)
	);




