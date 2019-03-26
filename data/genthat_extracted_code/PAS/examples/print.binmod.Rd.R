library(PAS)


### Name: PAS.binmod.print
### Title: binmod.print
### Aliases: PAS.binmod.print binmod.print print print.binmod

### ** Examples

#load PAS library
library (PAS)
#load the demo data
data (beef)
#conduct bin model analysis.
binmod.result=binmod (x, y, map)
print(binmod.result)
#show structure of a binmod object
str(binmod.result)



