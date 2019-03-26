library(IsoplotR)


### Name: evolution
### Title: Th-U evolution diagram
### Aliases: evolution

### ** Examples

data(examples)
evolution(examples$ThU)

dev.new()
evolution(examples$ThU,transform=TRUE,
          isochron=TRUE,model=1)




