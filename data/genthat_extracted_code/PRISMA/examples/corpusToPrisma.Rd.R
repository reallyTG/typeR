library(PRISMA)


### Name: corpusToPrisma
### Title: Convert tm copus to PRISMA
### Aliases: corpusToPrisma

### ** Examples

if (require("tm") && packageVersion("tm") >= '0.6') {
  data(thesis)
  thesis
  thesis = corpusToPrisma(thesis, NULL, TRUE)
  thesis
}



