library(meta)


### Name: metacum
### Title: Cumulative meta-analysis
### Aliases: metacum
### Keywords: htest

### ** Examples

data(Fleiss93)
meta1 <- metabin(event.e, n.e, event.c, n.c,
                 data=Fleiss93, studlab=study,
                 sm="RR", method="I")
meta1

metacum(meta1)
metacum(meta1, pooled="random")

forest(metacum(meta1))
forest(metacum(meta1, pooled="random"))

metacum(meta1, sortvar=study)
metacum(meta1, sortvar=7:1)

meta2 <- update(meta1, title="Fleiss93 meta-analysis",
                backtransf=FALSE)
metacum(meta2)

data(Fleiss93cont)
meta3 <- metacont(n.e, mean.e, sd.e, n.c, mean.c, sd.c,
                  data = Fleiss93cont, sm = "SMD")
metacum(meta3)



