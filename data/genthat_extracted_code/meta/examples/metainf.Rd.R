library(meta)


### Name: metainf
### Title: Influence analysis in meta-analysis using leave-one-out method
### Aliases: metainf
### Keywords: htest

### ** Examples

data(Fleiss93)
meta1 <- metabin(event.e, n.e, event.c, n.c,
                 data=Fleiss93, studlab=study,
                 sm="RR", method="I")
meta1

metainf(meta1)
metainf(meta1, pooled="random")

forest(metainf(meta1))
forest(metainf(meta1), layout="revman5")
forest(metainf(meta1, pooled="random"))

metainf(meta1, sortvar=study)
metainf(meta1, sortvar=7:1)

meta2 <- update(meta1, title="Fleiss93 meta-analysis",
                backtransf=FALSE)
metainf(meta2)


data(Fleiss93cont)
meta3 <- metacont(n.e, mean.e, sd.e, n.c, mean.c, sd.c,
                  data = Fleiss93cont, sm = "SMD")
metainf(meta3)



