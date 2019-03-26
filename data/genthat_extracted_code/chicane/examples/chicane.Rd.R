library(chicane)


### Name: chicane
### Title: chicane
### Aliases: chicane

### ** Examples

# start from BAM file
## No test: 
bam <- system.file('extdata', 'Bre80_2q35.bam', package = 'chicane');
baits <- system.file('extdata', '2q35.bed', package = 'chicane');
fragments <- system.file('extdata', 'GRCh38_HindIII_chr2.bed.gz', package = 'chicane');
results <- chicane(
	bam = bam, 
	baits = baits, 
	fragments = fragments
	);
## End(No test)

# start from pre-processed data
data(bre80); 
results <- chicane(interactions = bre80);




