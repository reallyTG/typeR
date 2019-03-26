library(beezdemand)


### Name: ExtraF
### Title: ExtraF
### Aliases: ExtraF

### ** Examples

## Compare two groups using equation by Koffarnus et al., 2015 and a fixed k of 2
## No test: 
apt$group <- NA
apt[apt$id %in% sample(unique(apt$id), length(unique(apt$id))/2), "group"] <- "a"
apt$group[is.na(apt$group)] <- "b"
ExtraF(apt, "koff", k = 2, groupcol = "group")
## End(No test)



