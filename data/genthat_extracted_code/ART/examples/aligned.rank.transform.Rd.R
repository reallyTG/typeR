library(ART)


### Name: aligned.rank.transform
### Title: Aligned Rank Transform procedure
### Aliases: aligned.rank.transform

### ** Examples

# Input data contained in the Higgins1990-Table1.csv file distributed with ARTool
	# The data were used in the 1990 paper cited in the References section
	data(higgins1990, package = "ART");
# Two-factor full factorial model that will be fitted to the data
art.results = aligned.rank.transform(Response ~ Row * Column, data = data.higgins1990);
print(art.results$aligned, digits = 4);
print(art.results$significance);



