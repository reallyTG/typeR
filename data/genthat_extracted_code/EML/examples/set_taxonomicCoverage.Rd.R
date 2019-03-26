library(EML)


### Name: set_taxonomicCoverage
### Title: set_taxonomicCoverage
### Aliases: set_taxonomicCoverage

### ** Examples

taxon_coverage <-
 set_taxonomicCoverage(list(KINGDOM="Plantae",
                            PHYLUM="Phaeophyta",
                            CLASS="Phaeophyceae",
                            ORDER="Laminariales",
                            FAMILY="Lessoniaceae",
                            GENUS="Macrocystis",
                            genusSpecies="Macrocystis pyrifera",
                            commonName="MAPY"))

df <- data.frame(KINGDOM="Plantae",
                 PHYLUM="Phaeophyta",
                 CLASS="Phaeophyceae",
                 ORDER="Laminariales",
                 FAMILY="Lessoniaceae",
                 GENUS="Macrocystis",
                 genusSpecies="Macrocystis pyrifera",
                 commonName="MAPY")
taxon_coverage <- set_taxonomicCoverage(df)




