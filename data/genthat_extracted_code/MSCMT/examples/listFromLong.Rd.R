library(MSCMT)


### Name: listFromLong
### Title: Convert Long Format to List Format
### Aliases: listFromLong

### ** Examples

if (require("Synth")) {
  data(basque)
  Basque <- listFromLong(basque, unit.variable="regionno", 
                         time.variable="year", 
                         unit.names.variable="regionname")
  names(Basque)
  head(Basque$gdpcap)
}



