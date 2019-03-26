library(gglogo)


### Name: position_logo
### Title: Logo positioning for overlapping objects on top of one another.
### Aliases: position_logo PositionLogo position_classic PositionClassic
### Keywords: datasets

### ** Examples

## No test: 
library(ggplot2)
data(sequences)

# to make the most of comparisons, largest letters ar aligned along their minimum to
# work out the main sequence.
ggplot(data = ggfortify(sequences, "peptide", treatment = "class")) +
  geom_logo(aes(x = class, y = bits, fill = Water, label = element), position="logo") + 
  facet_wrap(~position)

# in the classic logo plots letters are stacked in an ordered fasahion on top of each other
ggplot(data = ggfortify(sequences, "peptide", treatment = "class")) +
  geom_logo(aes(x = class, y = bits, fill = Water, label = element), position="classic") + 
  facet_wrap(~position)
## End(No test)



