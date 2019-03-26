library(gfer)


### Name: plotScatterPie
### Title: plotScatterPie
### Aliases: plotScatterPie

### ** Examples



GDPColor_CWR <- c("#6B8033", "#020303", "#0D77B9")


data(GDPmix)

# in colnames(GDPmix), there must be x, y, r, label.
# but right now, GDPmix has x, y, r, but lacks a label column, let's assign label to province column
colnames(GDPmix)[1] <- 'label'

## Not run: 
##D plotScatterPie(GDPmix, pieRange = 4:6, pieColor = GDPColor_CWR)
## End(Not run)






