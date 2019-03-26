library(GeNetIt)


### Name: build.node.data
### Title: Build node data
### Aliases: build.node.data

### ** Examples

data(ralu.site)

# Build from/to site (node) level data structure 
site.parms = c("AREA_m2", "PERI_m", "Depth_m", "TDS")
site <- build.node.data(ralu.site@data, group.ids = c("SiteName"), 
                        from.parms = site.parms ) 
 



