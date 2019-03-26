library(neuropsychology)


### Name: theme_neuropsychology
### Title: A minimal theme for ggplot2.
### Aliases: theme_neuropsychology

### ** Examples

require(ggplot2)
require(neuropsychology)

df <- personality

ggplot(df, aes(x=Age, y=Negative_Affect, colour=Sex, fill=Sex)) +
  geom_point() +
  geom_smooth(method="lm", fullrange=TRUE) +

  theme_neuropsychology() +

  xlab("\nAge") +
  ylab("Negative Affect\n") +
  scale_fill_brewer(palette="Set1",direction=-1) +
  scale_colour_brewer(palette="Set1",direction=-1)



