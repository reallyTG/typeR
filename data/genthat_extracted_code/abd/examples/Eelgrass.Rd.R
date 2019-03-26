library(abd)


### Name: Eelgrass
### Title: Eelgrass Genotypes
### Aliases: Eelgrass
### Keywords: datasets

### ** Examples

Eelgrass

# Convert treatment.genotypes to a factor
Eelgrass$genotypesF <-
  factor(Eelgrass$genotypes)
str(Eelgrass)
xyplot(shoots ~ genotypes, Eelgrass)
xyplot(shoots ~ genotypesF, Eelgrass)



