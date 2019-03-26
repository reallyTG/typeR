library(seqinr)


### Name: plotPanels
### Title: Representation of Amplicon Size Ranges of a STR kit.
### Aliases: plotPanels

### ** Examples

path1 <- system.file("abif/AmpFLSTR_Panels_v1.txt", package = "seqinr")
res1 <- readPanels(path1)

par(mfrow = c(2,1))
plotPanels("Identifiler_v1", res1)
plotPanels("SEfiler_v1", res1)




