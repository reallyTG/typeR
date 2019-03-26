library(concordance)


### Name: desc
### Title: desc
### Aliases: desc
### Keywords: concordance

### ** Examples

codes.of.origin <- codedesc$sitc3 # Vector of values to be converted
desc(codes.of.origin, "sitc3")

desc("00121", "sitc3")
## % Returns vector "Meat sheep/goat fr/ch/fz"

desc("0012", "sitc3")
## % Returns vector of length 6:
## % "Meat sheep/goat fr/ch/fz" "Pork fresh/chilled/frozn" "Poultry fresh/chld/frozn"
## % "Meat,equine,frsh/chl/frz" "Edible offal,frs/chl/frz" "Meat/offal nes,fr/ch/frz"
## % these are descriptions for all the codes starting with 0012



