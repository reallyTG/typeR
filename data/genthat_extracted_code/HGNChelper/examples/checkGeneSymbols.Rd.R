library(HGNChelper)


### Name: checkGeneSymbols
### Title: Title Identify outdated or Excel-mogrified gene symbols
### Aliases: checkGeneSymbols

### ** Examples

library(HGNChelper)
human = c("FN1", "TP53", "UNKNOWNGENE","7-Sep", "9/7", "1-Mar", "Oct4", "4-Oct",
      "OCT4-PG4", "C19ORF71", "C19orf71")
checkGeneSymbols(human)
## mouse
mouse <- c("1-Feb", "Pzp", "A2m")
checkGeneSymbols(mouse, species="mouse")
if (interactive()){
  ##Run checkGeneSymbols with a brand-new map downloaded from HGNC:
  source(system.file("hgncLookup.R", package = "HGNChelper"))
  ## You should save this if you are going to use it multiple times,
  ## then load it from file rather than burdening HGNC's servers.
  save(hgnc.table, file="hgnc.table.rda", compress="bzip2")
  load("hgnc.table.rda")
  checkGeneSymbols(human, species=NULL, map=hgnc.table)
  checkGeneSymbols(human, species=NULL, map=mouse.table)
}



