library(meta)


### Name: amlodipine
### Title: Amlodipine for Work Capacity
### Aliases: amlodipine
### Keywords: datasets

### ** Examples

data(amlodipine)
#
m <- metacont(n.amlo, mean.amlo, sqrt(var.amlo),
              n.plac, mean.plac, sqrt(var.plac),
              data=amlodipine, studlab=study)

m.hakn <- metacont(n.amlo, mean.amlo, sqrt(var.amlo),
                   n.plac, mean.plac, sqrt(var.plac),
                   data=amlodipine, studlab=study,
                   hakn=TRUE)

# Results for mean difference - see Table III in Hartung and Knapp (2001) 
#
res.md <- rbind(data.frame(summary(m)$fixed)[c("TE", "lower", "upper")],
                data.frame(summary(m)$random)[c("TE", "lower", "upper")],
                data.frame(summary(m.hakn)$random)[c("TE", "lower", "upper")])
#
res.md <- round(res.md, 5)
#
row.names(res.md) <- c("FE", "RE", "RE (HaKn)")
names(res.md) <- c("Absolute difference", "CI lower", "CI upper")
#
res.md



