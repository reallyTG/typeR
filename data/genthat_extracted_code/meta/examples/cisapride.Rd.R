library(meta)


### Name: cisapride
### Title: Cisapride in Non-Ulcer Dispepsia
### Aliases: cisapride
### Keywords: datasets

### ** Examples

data(cisapride)

m.or <- metabin(event.cisa, n.cisa, event.plac, n.plac,
                data=cisapride, sm="OR", method="Inverse",
                studlab=study, addincr=TRUE)

m.rr <- metabin(event.cisa, n.cisa, event.plac, n.plac,
                data=cisapride, sm="RR", method="Inverse",
                studlab=study, addincr=TRUE)

m.or.hakn <- metabin(event.cisa, n.cisa, event.plac, n.plac,
                     data=cisapride, sm="OR", method="Inverse",
                     studlab=study, addincr=TRUE,
                     hakn=TRUE)

m.rr.hakn <- metabin(event.cisa, n.cisa, event.plac, n.plac,
                     data=cisapride, sm="RR", method="Inverse",
                     studlab=study, addincr=TRUE,
                     hakn=TRUE)

# Results for log risk ratio - see Table VII in Hartung and Knapp (2001) 
#
res.rr <- rbind(data.frame(summary(m.rr)$fixed)[c("TE", "lower", "upper")],
                data.frame(summary(m.rr)$random)[c("TE", "lower", "upper")],
                data.frame(summary(m.rr.hakn)$random)[c("TE", "lower", "upper")])
#
row.names(res.rr) <- c("FE", "RE", "RE (HaKn)")
names(res.rr) <- c("Log risk ratio", "CI lower", "CI upper")
#
res.rr


# Results for log odds ratio (Table VII in Hartung and Knapp 2001) 
#
res.or <- rbind(data.frame(summary(m.or)$fixed)[c("TE", "lower", "upper")],
                data.frame(summary(m.or)$random)[c("TE", "lower", "upper")],
                data.frame(summary(m.or.hakn)$random)[c("TE", "lower", "upper")])
#
row.names(res.or) <- c("FE", "RE", "RE (HaKn)")
names(res.or) <- c("Log odds ratio", "CI lower", "CI upper")
#
res.or



