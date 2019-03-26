library(PTXQC)


### Name: YAMLClass-class
### Title: Query a YAML object for a certain parameter.
### Aliases: YAMLClass-class YAMLClass

### ** Examples

    yc = YAMLClass$new(list())
    val = yc$getYAML("cat$subCat", "someDefault")
    val  ## someDefault
    val = yc$setYAML("cat$subCat", "someValue")
    val  ## someValue
    yc$getYAML("cat$subCat", "someDefault") ## still 'someValue' (since its set already)




