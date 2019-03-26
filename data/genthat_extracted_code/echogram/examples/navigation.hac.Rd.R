library(echogram)


### Name: navigation.hac
### Title: Compute bearing, navigated distance and speed
### Aliases: navigation.hac
### Keywords: manip

### ** Examples

 hacfile <- system.file("hac", "D20150510-T202221.hac", package="echogram")
 pos <- position.hac( hacfile )
 pos
 pos2 <- navigation.hac(pos)
 pos2



