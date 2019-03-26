library(meta)


### Name: trimfill.meta
### Title: Trim-and-fill method to adjust for bias in meta-analysis
### Aliases: trimfill trimfill.meta trimfill.default
### Keywords: htest

### ** Examples

data(Fleiss93)
meta1 <- metabin(event.e, n.e, event.c, n.c,
                 data=Fleiss93, sm="OR")
tf1 <- trimfill(meta1)
summary(tf1)
funnel(tf1)
funnel(tf1, pch=ifelse(tf1$trimfill, 1, 16),
       level=0.9, comb.random=FALSE)
#
# Use log odds ratios on x-axis
#
funnel(tf1, backtransf=FALSE)
funnel(tf1, pch=ifelse(tf1$trimfill, 1, 16),
       level=0.9, comb.random=FALSE, backtransf=FALSE)

trimfill(meta1$TE, meta1$seTE, sm=meta1$sm)



