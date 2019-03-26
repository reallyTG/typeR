library(adfExplorer)


### Name: adf.file.exists
### Title: Test file or directory existsence in an amigaDisk object
### Aliases: adf.file.exists adf.file.exists,amigaDisk,character-method

### ** Examples

data(adf.example)

## This file exists:
adf.file.exists(adf.example, "df0:mods/mod.intro")

## This file doesn't:
adf.file.exists(adf.example, "df0:idontexist")



