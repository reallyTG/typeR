library(meta)


### Name: metabias
### Title: Test for funnel plot asymmetry
### Aliases: metabias metabias.meta metabias.default
### Keywords: htest

### ** Examples

data(Olkin95)
meta1 <- metabin(event.e, n.e, event.c, n.c,
                 data=Olkin95, subset=1:10,
                 sm="RR", method="I")

metabias(meta1)
metabias(meta1, plotit=TRUE)

metabias(meta1, method.bias="rank")
metabias(meta1, method.bias="rank", correct=TRUE)


metabias(meta1, method.bias="count")

metabias(meta1, method.bias="linreg")$p.value


#
# Arcsine test (based on linear regression):
#
meta1.as <- metabin(event.e, n.e, event.c, n.c,
                    data=Olkin95, subset=1:10,
                    sm="ASD", method="I")
metabias(meta1.as)
#
# Same result (using function metabias.default):
#
metabias(meta1.as$TE, meta1.as$seTE)


#
# No test for funnel plot asymmetry calculated:
#
meta2 <- metabin(event.e, n.e, event.c, n.c,
                 data=Olkin95, subset=1:5,
                 sm="RR", method="I")
metabias(meta2)

meta3 <- metabin(event.e, n.e, event.c, n.c,
                 data=Olkin95, subset=1:2,
                 sm="RR", method="I")
metabias(meta3)

# Test for funnel plot asymmetry calculated
# (use of argument k.min):
#
metabias(meta2, k.min=5)



