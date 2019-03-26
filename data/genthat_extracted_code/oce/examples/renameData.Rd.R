library(oce)


### Name: renameData
### Title: Rename items in the data slot of an oce object
### Aliases: renameData

### ** Examples

data(ctd)
new <- renameData(ctd, "temperature", "temperature68")
new <- oceSetData(new, name="temperature",
                  value=T90fromT68(new[["temperature68"]]),
                  unit=list(unit=expression(degree*C),scale="ITS=90"))



