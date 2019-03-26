library(adiv)


### Name: dsimcom
### Title: Functional or Phylogenetic Similarity between Species and
###   Communities
### Aliases: dsimcom SQ dsimTaxo dsimFun dsimTree
### Keywords: models

### ** Examples

data(macroloire, package="ade4") 

Ssokalsneath <- dsimcom(t(macroloire$fau), method=1, option=c("relative"))
Sjaccard <- dsimcom(t(macroloire$fau), method=2, option=c("relative"))
Ssorensen <- dsimcom(t(macroloire$fau), method=3, option=c("relative"))
Sochiai <- dsimcom(t(macroloire$fau), method=4, option=c("relative"))
Sbeta <- dsimcom(t(macroloire$fau), method=5, option=c("relative"))

SQUNIF <- SQ(t(macroloire$fau))

# The taxonomy is contained in macroloire$taxo

s_species_sokalsneath_taxo <- dsimTaxo(macroloire$taxo, method=1) # Using formula a/(a+2b+2c) 
# (see notations below)
s_species_jaccard_taxo <- dsimTaxo(macroloire$taxo, method=2) # Using formula a/(a+b+c) 
s_species_sorensen_taxo <- dsimTaxo(macroloire$taxo, method=3) # Using formula 2a/(2a+b+c) 
s_species_ochiai_taxo <- dsimTaxo(macroloire$taxo, method=4) # Using a/sqrt((a+b)(a+c)) 
s_species_beta_taxo <- dsimTaxo(macroloire$taxo, method=5) # Using 4a/(4a+b+c)


# To check that these matrices of taxonomic similarities among species are p.s.d.
# we have to verify that their eigenvalues are all nonnegative:
all(eigen(s_species_sokalsneath_taxo)$val>-(1e-8))
all(eigen(s_species_jaccard_taxo)$val>-(1e-8))
all(eigen(s_species_sorensen_taxo)$val>-(1e-8))
all(eigen(s_species_ochiai_taxo)$val>-(1e-8))
all(eigen(s_species_beta_taxo)$val>-(1e-8))

# Compositions of the communities
m <- t(macroloire$fau[rownames(s_species_sokalsneath_taxo), ])
# Taxomonic similarities among species
s <- s_species_sokalsneath_taxo

Ssokalsneath_taxo <- dsimcom(m, s, method = 1)
SQwith_species_sokalsneath_taxo <- SQ(m, s)

# Compositions of the communities
m <- t(macroloire$fau[rownames(s_species_jaccard_taxo), ])
# Taxonomic similarities among species
s <- s_species_jaccard_taxo  
Sjaccard_taxo <- dsimcom(m, s, method = 2)
SQwith_species_jaccard_taxo <- SQ(m, s)

# Compositions of the communities
m <- t(macroloire$fau[rownames(s_species_sorensen_taxo), ])
# Taxonomic similarities among species
s <- s_species_sorensen_taxo  

Ssorensen_taxo <- dsimcom(m, s, method = 3)
SQwith_species_sorensen_taxo <- SQ(m, s)

# Compositions of the communities
m <- t(macroloire$fau[rownames(s_species_ochiai_taxo), ])
# Taxonomic similarities among species
s <- s_species_ochiai_taxo  

Sochiai_taxo <- dsimcom(m, s, method = 4)
SQwith_species_ochiai_taxo <- SQ(m, s)


# Compositions of the communities
m <- t(macroloire$fau[rownames(s_species_beta_taxo), ])
# Taxonomic similarities among species
s <- s_species_beta_taxo  

Sbeta_taxo <- dsimcom(m, s, method = 5)
SQwith_species_beta_taxo <- SQ(m, s)

# The matrix named feed below contains feeding attributes as rows,
# species as columns, and affinities (proportions) as entries.
feed <- macroloire$traits[ ,-(1:4)]

# Feeding habits comprise seven categories: engulfers, shredders, scrapers,
# deposit-feeders, active filter-feeders, passive filter-feeders and piercers, in this order.

# Functional similarities among species are computed as indicated in the main text
s_species_sokalsneath_feed <- dsimFun(feed, vartype = "P", method=1)
s_species_jaccard_feed <- dsimFun(feed, vartype = "P", method=2)
s_species_sorensen_feed <- dsimFun(feed, vartype = "P", method=3)
s_species_ochiai_feed <- dsimFun(feed, vartype = "P", method=4)
s_species_beta_feed <- dsimFun(feed, vartype = "P", method=5)

all(eigen(s_species_sokalsneath_feed)$val>-(1e-8))
all(eigen(s_species_jaccard_feed)$val>-(1e-8))
all(eigen(s_species_sorensen_feed)$val>-(1e-8))
all(eigen(s_species_ochiai_feed)$val>-(1e-8))
all(eigen(s_species_beta_feed)$val>-(1e-8))

Ssokalsneath_feed <- dsimcom(t(macroloire$fau), s_species_sokalsneath_feed, method=1)
SQwith_species_sokalsneath_feed <- SQ(t(macroloire$fau), s_species_sokalsneath_feed)

Sjaccard_feed <- dsimcom(t(macroloire$fau), s_species_jaccard_feed, method=2)
SQwith_species_jaccard_feed <- SQ(t(macroloire$fau), s_species_jaccard_feed)

Ssorensen_feed <- dsimcom(t(macroloire$fau), s_species_sorensen_feed, method=3)
SQwith_species_sorensen_feed <- SQ(t(macroloire$fau), s_species_sorensen_feed)

Sochiai_feed <- dsimcom(t(macroloire$fau), s_species_ochiai_feed, method=4)
SQwith_species_ochiai_feed <- SQ(t(macroloire$fau), s_species_ochiai_feed)

Sbeta_feed <- dsimcom(t(macroloire$fau), s_species_sorensen_feed, method=5)


all(eigen(Ssokalsneath_feed)$val>-(1e-8))
all(eigen(Sjaccard_feed)$val>-(1e-8))
all(eigen(Ssorensen_feed)$val>-(1e-8))
all(eigen(Sochiai_feed)$val>-(1e-8))
all(eigen(Sbeta_feed)$val>-(1e-8))


par(mfrow=c(3, 5))
plot(SQUNIF, Ssokalsneath, xlim=c(0,1), ylim=c(0,1), asp=1)
segments(0, 0, 1,1)
plot(SQUNIF, Sjaccard, xlim=c(0,1), ylim=c(0,1) , asp=1)
segments(0, 0, 1,1)
plot(SQUNIF, Ssorensen, xlim=c(0,1), ylim=c(0,1) , asp=1)
segments(0, 0, 1,1)
plot(SQUNIF, Sochiai, xlim=c(0,1), ylim=c(0,1) , asp=1)
segments(0, 0, 1,1)
plot(SQUNIF, Sbeta, xlim=c(0,1), ylim=c(0,1) , asp=1)
segments(0, 0, 1,1)

plot(SQwith_species_sokalsneath_taxo, Ssokalsneath_taxo, xlim=c(0,1), ylim=c(0,1), asp=1)
segments(0, 0, 1,1)
plot(SQwith_species_jaccard_taxo, Sjaccard_taxo, xlim=c(0,1), ylim=c(0,1) , asp=1)
segments(0, 0, 1,1)
plot(SQwith_species_sorensen_taxo, Ssorensen_taxo, xlim=c(0,1), ylim=c(0,1) , asp=1)
segments(0, 0, 1,1)
plot(SQwith_species_ochiai_taxo, Sochiai_taxo, xlim=c(0,1), ylim=c(0,1) , asp=1)
segments(0, 0, 1,1)
plot(SQwith_species_beta_taxo, Sbeta_taxo, xlim=c(0,1), ylim=c(0,1) , asp=1)
segments(0, 0, 1,1)

plot(SQwith_species_sokalsneath_feed, Ssokalsneath_feed, xlim=c(0,1), ylim=c(0,1), asp=1)
segments(0, 0, 1,1)
plot(SQwith_species_jaccard_feed, Sjaccard_feed, xlim=c(0,1), ylim=c(0,1) , asp=1)
segments(0, 0, 1,1)
plot(SQwith_species_sorensen_feed, Ssorensen_feed, xlim=c(0,1), ylim=c(0,1) , asp=1)
segments(0, 0, 1,1)
plot(SQwith_species_ochiai_feed, Sochiai_feed, xlim=c(0,1), ylim=c(0,1) , asp=1)
segments(0, 0, 1,1)
plot(SQwith_species_sorensen_feed, Sbeta_feed, xlim=c(0,1), ylim=c(0,1) , asp=1)
segments(0, 0, 1,1)

par(mfrow=c(1,1))



