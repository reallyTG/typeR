library(gglogo)


### Name: ggfortify
### Title: Convert sequence data to a format suitable for logo plots
### Aliases: ggfortify

### ** Examples

## No test: 
library(ggplot2)
data(sequences)

ggplot(data = ggfortify(sequences, "peptide", treatment = "class")) +
  geom_logo(aes(x = class, y = bits, fill = Water, label = element)) + 
  facet_wrap(~position)
  
ggplot(data = ggfortify(sequences, "peptide", treatment = "class")) +
  geom_logo(aes(x = class, y = bits, fill = Polarity, label = element)) + 
  facet_wrap(~position, ncol = 18) + 
  theme(legend.position = "bottom")
## End(No test)



