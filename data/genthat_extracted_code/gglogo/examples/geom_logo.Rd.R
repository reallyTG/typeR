library(gglogo)


### Name: GeomLogo
### Title: Sequence logo plots.
### Aliases: GeomLogo geom_logo
### Keywords: datasets

### ** Examples

## No test: 
library(ggplot2)
data(sequences)
ggplot(data = ggfortify(sequences, "peptide")) +      
  geom_logo(aes(x=position, y=bits, group=element, 
     label=element, fill=interaction(Polarity, Water)),
     alpha = 0.6)  +
  scale_fill_brewer(palette="Paired") +
  theme(legend.position = "bottom")
  
ggplot(data = ggfortify(sequences, "peptide", treatment = "class")) + 
  geom_logo(aes(x=class, y=bits, group=element, 
     label=element, fill=element)) + 
  facet_wrap(~position, ncol=18) +
  theme(legend.position = "bottom")
  
ggplot(data = ggfortify(sequences, "peptide", treatment = "class")) + 
  geom_logo(aes(x=position, y=bits, group=element, label=element, fill=element)) + 
  facet_wrap(~class, ncol=1) + theme_bw()
  
ggplot(data = ggfortify(sequences, "peptide", treatment = "class")) + 
  geom_logo(aes(x=class, y=bits, group=element, 
                label=element, fill=interaction(Polarity, Water))) + 
  scale_fill_brewer("Amino-acids properties", palette="Paired") + 
  facet_wrap(~position, ncol=18) + 
  theme(legend.position="bottom") + 
  xlab("") + ylab("Shannon information in bits")
  
## End(No test)



