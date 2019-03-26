library(chicane)


### Name: combine.replicates
### Title: combine.replicates
### Aliases: combine.replicates

### ** Examples

## No test: 
# preprocess data
	bam <- system.file('extdata', 'Bre80_2q35.bam', package = 'chicane');
	baits <- system.file('extdata', '2q35.bed', package = 'chicane');
	fragments <- system.file('extdata', 'GRCh38_HindIII_chr2.bed.gz', package = 'chicane');
	input.data <- prepare.data(
	bam = bam, 
	baits = baits, 
	fragments = fragments
	);

	# combined two datasets into one
merged <- combine.replicates(list(input.data, input.data));
## End(No test)




