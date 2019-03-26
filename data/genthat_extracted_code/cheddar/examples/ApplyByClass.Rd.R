library(cheddar)


### Name: ApplyByClass
### Title: Apply by class
### Aliases: ApplyByClass SumBiomassByClass SumMByClass SumNByClass
### Keywords: utilities

### ** Examples

data(TL84)

# Sum body mass by category
ApplyByClass(TL84, 'M', 'category', sum)

# A more convenient way to sum body mass by category
SumMByClass(TL84)

# Sum body mass by kingdom. The 'Unclassified flagellates' node does not have a 
# kingdom, so we get a value labelled '<unnamed>'.
SumMByClass(TL84, 'kingdom')

# Maximum body mass by category
ApplyByClass(TL84, 'M', 'category', max)

# A list of min and max M
ApplyByClass(TL84, 'M', 'category', range)

# A list of min and max M by kingom
ApplyByClass(TL84, 'M', 'kingdom', range)

# The same values as a matrix
do.call('rbind', ApplyByClass(TL84, 'M', 'kingdom', range))

# Broadstone Stream has some nodes in every category without M so all returned 
# values are NA.
data(BroadstoneStream)
SumMByClass(BroadstoneStream)

# Get rid of the NA values
SumMByClass(BroadstoneStream, na.rm=TRUE)



