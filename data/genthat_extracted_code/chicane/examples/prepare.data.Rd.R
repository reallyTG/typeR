library(chicane)


### Name: prepare.data
### Title: prepare.data
### Aliases: prepare.data

### ** Examples

## No test: 
bam <- system.file('extdata', 'Bre80_2q35.bam', package = 'chicane');
baits <- system.file('extdata', '2q35.bed', package = 'chicane');
fragments <- system.file('extdata', 'GRCh38_HindIII_chr2.bed.gz', package = 'chicane');
input.data <- prepare.data(
	bam = bam, 
	baits = baits, 
	fragments = fragments
	);
## End(No test)




