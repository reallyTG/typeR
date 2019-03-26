library(gglogo)


### Name: StatLogo
### Title: Calculation of all pieces necessary to plot a logo sequence plot
### Aliases: StatLogo stat_logo
### Keywords: datasets

### ** Examples

# See geom_logo for examples
# Generate data
data(sequences)
library(ggplot2)

ggplot(data = ggfortify(sequences, "peptide")) + 
  geom_logo(aes(x=position, y=bits, label=element, 
                group=interaction(position, element)), 
            alpha=0.5)



