library(lulcc)


### Name: ExpVarRasterList
### Title: Create an ExpVarRasterList object
### Aliases: ExpVarRasterList ExpVarRasterList,missing-method
###   ExpVarRasterList,missing,character-method
###   ExpVarRasterList,character-method
###   ExpVarRasterList,character,character-method
###   ExpVarRasterList,RasterStack-method
###   ExpVarRasterList,RasterStack,character-method
###   ExpVarRasterList,list-method ExpVarRasterList,list,character-method

### ** Examples


## Plum Island Ecosystems
ef <- ExpVarRasterList(x=pie, pattern="ef")

## Sibuyan
ef <- ExpVarRasterList(x=sibuyan$maps, pattern="ef")




