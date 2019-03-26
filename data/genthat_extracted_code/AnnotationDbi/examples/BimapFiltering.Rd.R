library(AnnotationDbi)


### Name: toggleProbes
### Title: Methods for getting/setting the filters on a Bimap object
### Aliases: toggleProbes toggleProbes,ProbeAnnDbBimap-method
###   toggleProbes,ProbeAnnDbMap-method
###   toggleProbes,ProbeIpiAnnDbMap-method
###   toggleProbes,ProbeGo3AnnDbBimap-method hasMultiProbes
###   hasMultiProbes,ProbeAnnDbBimap-method
###   hasMultiProbes,ProbeAnnDbMap-method
###   hasMultiProbes,ProbeIpiAnnDbMap-method
###   hasMultiProbes,ProbeGo3AnnDbBimap-method hasSingleProbes
###   hasSingleProbes,ProbeAnnDbBimap-method
###   hasSingleProbes,ProbeAnnDbMap-method
###   hasSingleProbes,ProbeIpiAnnDbMap-method
###   hasSingleProbes,ProbeGo3AnnDbBimap-method getBimapFilters
###   getBimapFilters,AnnDbBimap-method setInpBimapFilter
###   setInpBimapFilter,InpAnnDbBimap-method
### Keywords: methods

### ** Examples

  ## Make a Bimap that contains all the probes
  require("hgu95av2.db")
  mapWithMultiProbes <- toggleProbes(hgu95av2ENTREZID, "all")
  count.mappedLkeys(hgu95av2ENTREZID)
  count.mappedLkeys(mapWithMultiProbes)

  ## Check that it has both multiply and singly matching probes:
  hasMultiProbes(mapWithMultiProbes)
  hasSingleProbes(mapWithMultiProbes)

  ## Make it have Multi probes ONLY:
  OnlyMultiProbes = toggleProbes(mapWithMultiProbes, "multiple")
  hasMultiProbes(OnlyMultiProbes)
  hasSingleProbes(OnlyMultiProbes)

  ## Convert back to a default map with only single probes exposed
  OnlySingleProbes = toggleProbes(OnlyMultiProbes, "single")
  hasMultiProbes(OnlySingleProbes)
  hasSingleProbes(OnlySingleProbes)


  ## List the filters on the inparanoid mapping 
  # library(hom.Dm.inp.db)
  # getBimapFilters(hom.Dm.inpANOGA)

  ## Here is how you can make a mapping with a
  ##different filter than the default:
  # f80 = setInpBimapFilter(hom.Dm.inpANOGA, "80%")
  # dim(hom.Dm.inpANOGA)
  # dim(f80)




