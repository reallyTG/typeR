## ----setup, echo=FALSE---------------------------------------------------

knitr::opts_chunk$set(fig.width = 6,
                    fig.height = 4,
                    fig.align='center',
                    dev = "png")


## ---- message=FALSE------------------------------------------------------
library(ggplot2)
library(gglogo)
data(alphabet)
head(alphabet)

## ------------------------------------------------------------------------
qplot(x, y, geom="polygon", data=alphabet) + 
  facet_wrap(facets=~group, ncol=13) +
  coord_equal()

## ---- warning=FALSE------------------------------------------------------
alphas <- c(LETTERS, letters, 0:9)
alphabet_garamond <- createPolygons(alphas, font="Garamond")
alphabet_garamond$group <- factor(alphabet_garamond$group, levels=alphas)

qplot(x,y, geom="polygon", data=alphabet_garamond,  group="pathGroup") +
  facet_wrap(facets=~group, ncol=13)

## ---- warning=FALSE------------------------------------------------------
alphas <- c(LETTERS, letters, 0:9)
alphabet_helvetica <- createPolygons(alphas, font="Helvetica")
alphabet_helvetica$group <- factor(alphabet_helvetica$group, levels=alphas)

qplot(x,y, geom="polygon", data=alphabet_helvetica) +
  facet_wrap(facets=~group, ncol=13)

## ---- warning=FALSE------------------------------------------------------
alphas <- c(LETTERS, letters, 0:9)
alphabet_comic <- createPolygons(alphas, font="Comic Sans MS", scale=TRUE)
alphabet_comic$group <- factor(alphabet_comic$group, levels=alphas)

qplot(x,y, geom="polygon", data=alphabet_comic,  group="pathGroup") +
  facet_wrap(facets=~group, ncol=13)

## ------------------------------------------------------------------------
data(sequences)
ggplot(data=ggfortify(sequences, seq="peptide", treatment="class")) +
  geom_logo(aes(x = class, y = bits, label=element, group=element, 
                fill = interaction(Polarity, Water)), 
            alphabet = alphabet_braille, 
            alpha = 0.8) +
  facet_wrap(~position) +
  scale_fill_brewer(palette="Paired")


