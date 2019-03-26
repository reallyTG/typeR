library(qdap)


### Name: automated_readability_index
### Title: Readability Measures
### Aliases: automated_readability_index coleman_liau SMOG flesch_kincaid
###   fry linsear_write
### Keywords: Automated Coleman Flesch-Kincaid, Fry, Index, Liau, Linsear
###   Readability SMOG, Write readability,

### ** Examples

## Not run: 
##D AR1 <- with(rajSPLIT, automated_readability_index(dialogue, list(person, act)))
##D ltruncdf(AR1,, 15)
##D scores(AR1)
##D counts(AR1)
##D plot(AR1)
##D plot(counts(AR1))
##D 
##D AR2 <- with(rajSPLIT, automated_readability_index(dialogue, list(sex, fam.aff)))
##D ltruncdf(AR2,, 15)
##D scores(AR2)
##D counts(AR2)
##D plot(AR2)
##D plot(counts(AR2))
##D 
##D AR3 <- with(rajSPLIT, automated_readability_index(dialogue, person))
##D ltruncdf(AR3,, 15)
##D scores(AR3)
##D head(counts(AR3))
##D plot(AR3)
##D plot(counts(AR3))
##D 
##D CL1 <- with(rajSPLIT, coleman_liau(dialogue, list(person, act)))
##D ltruncdf(CL1, 20)
##D head(counts(CL1))
##D plot(CL1)
##D 
##D CL2 <- with(rajSPLIT, coleman_liau(dialogue, list(sex, fam.aff)))
##D ltruncdf(CL2)
##D plot(counts(CL2))
##D 
##D (SM1 <- with(rajSPLIT, SMOG(dialogue, list(person, act))))
##D plot(counts(SM1))
##D plot(SM1)
##D 
##D (SM2 <- with(rajSPLIT, SMOG(dialogue, list(sex, fam.aff))))
##D 
##D (FL1 <- with(rajSPLIT, flesch_kincaid(dialogue, list(person, act))))
##D plot(scores(FL1))
##D plot(counts(FL1))
##D 
##D (FL2 <-  with(rajSPLIT, flesch_kincaid(dialogue, list(sex, fam.aff))))
##D plot(scores(FL2))
##D plot(counts(FL2))
##D 
##D FR1 <- with(rajSPLIT, fry(dialogue, list(sex, fam.aff)))
##D scores(FR1)
##D plot(scores(FR1))
##D counts(FR1)
##D plot(counts(FR1))
##D 
##D FR2 <- with(rajSPLIT, fry(dialogue, person))
##D scores(FR2)
##D plot(scores(FR2))
##D counts(FR2)
##D plot(counts(FR2))
##D 
##D FR3 <- with(pres_debates2012, fry(dialogue, list(time, person)))
##D colsplit2df(scores(FR3))
##D plot(scores(FR3), auto.label = FALSE)
##D counts(FR3)
##D plot(counts(FR3))
##D 
##D library(ggplot2)
##D ggplot(colsplit2df(counts(FR3)), aes(sent.per.100.wrds, 
##D     syllables.per.100.wrds)) +
##D     geom_point(aes(fill=person), shape=21, size=3) +
##D     facet_grid(person~time)
##D     
##D LW1 <- with(rajSPLIT, linsear_write(dialogue, list(person, act)))
##D plot(scores(LW1))
##D plot(counts(LW1))
##D 
##D LW2 <- with(rajSPLIT, linsear_write(dialogue, list(sex, fam.aff)))
##D plot(scores(LW2), method="lm")
##D plot(counts(LW2))
## End(Not run)



