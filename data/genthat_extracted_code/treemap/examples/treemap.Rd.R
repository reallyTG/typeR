library(treemap)


### Name: treemap
### Title: Create a treemap
### Aliases: treemap

### ** Examples

#########################################
### quick example with Gross National Income data
#########################################
data(GNI2014)
treemap(GNI2014,
       index=c("continent", "iso3"),
       vSize="population",
       vColor="GNI",
       type="value",
       format.legend = list(scientific = FALSE, big.mark = " "))

#########################################
### extended examples with fictive business statistics data
#########################################
data(business)

#########################################
### treemap types
#########################################

# index treemap: colors are determined by the index argument
## Not run: 
##D # large example which takes some time...
##D treemap(business, 
##D         index=c("NACE1", "NACE2", "NACE3"), 
##D         vSize="turnover", 
##D         type="index")
## End(Not run)
treemap(business[business$NACE1=="C - Manufacturing",],
        index=c("NACE2", "NACE3"),
        vSize=c("employees"),
        type="index")

# value treemap: colors are derived from a numeric variable given by vColor 
# (when omited, all values are set to 1 as in the following example)
treemap(business,
        index=c("NACE1", "NACE2"),
        vSize="employees",
        title.legend="number of NACE4 categories",
        type="value")

# comparisson treemaps: colors indicate change of vSize with respect to vColor
treemap(business,
        index=c("NACE1", "NACE2"),
        vSize="employees",
        vColor="employees.prev",
        type="comp")

# density treemaps: colors indicate density (like a population density map)
treemap(business,
        index=c("NACE1", "NACE2"),
        vSize="turnover",
        vColor="employees/1000",
        type="dens")

## Not run: 
##D # depth treemap: show depth
##D treemap(business,
##D         index=c("NACE1", "NACE2", "NACE3"), 
##D         vSize="turnover",
##D         type="depth")
## End(Not run)

# categorical treemap: colors are determined by a categorical variable
business <- transform(business, data.available = factor(!is.na(turnover)), x = 1)
treemap(business,
        index=c("NACE1", "NACE2"),
        vSize="x",
        vColor="data.available",
        type="categorical")

## Not run: 
##D # color treemap
##D business$color <- rainbow(nlevels(business$NACE2))[business$NACE2]
##D treemap(business,
##D         index=c("NACE1", "NACE2"), 
##D         vSize="x",
##D         vColor="color",
##D         type="color")
##D 
##D # manual
##D business$color <- rainbow(nlevels(business$NACE2))[business$NACE2]
##D treemap(business,
##D         index=c("NACE1", "NACE2"), 
##D         vSize="turnover",
##D         vColor="employees",
##D         type="manual",
##D         palette=terrain.colors(10))
## End(Not run)

#########################################
### graphical options: control fontsizes
#########################################

## Not run: 
##D # draw labels of first index at fontsize 12 at the center, 
##D # and labels of second index at fontsize 8 top left
##D treemap(business, 
##D         index=c("NACE1", "NACE2"), 
##D         vSize="employees", 
##D         fontsize.labels=c(12, 8), 
##D         align.labels=list(c("center", "center"), c("left", "top")),
##D         lowerbound.cex.labels=1)
##D     
##D     
##D # draw all labels at fontsize 12 (only if they fit)
##D treemap(business,
##D         index=c("NACE1", "NACE2"),
##D         vSize="employees",
##D         fontsize.labels=12,
##D         lowerbound.cex.labels=1)
##D 
##D # draw all labels at fontsize 12, and if they don't fit, reduce to a minimum of .6*12
##D treemap(business,
##D         index=c("NACE1", "NACE2"),
##D         vSize="employees",
##D         fontsize.labels=12,
##D         lowerbound.cex.labels=.6)
##D 
##D # draw all labels at maximal fontsize
##D treemap(business,
##D         index=c("NACE1", "NACE2"),
##D         vSize="employees",
##D         lowerbound.cex.labels=0,
##D         inflate.labels = TRUE)
##D 
##D # draw all labels at fixed fontsize, even if they don't fit
##D treemap(business,
##D         index=c("NACE1", "NACE2"),
##D         vSize="employees",
##D         fontsize.labels=10,
##D         lowerbound.cex.labels=1,
##D         force.print.labels=TRUE)
##D 
##D #########################################
##D ### graphical options: color palettes
##D #########################################
##D 
##D ## for comp and value typed treemaps all diverging brewer palettes can be chosen
##D treemap(business,
##D         index=c("NACE1", "NACE2"),
##D         vSize="employees",
##D         vColor="employees.prev",
##D         type="comp",
##D         palette="RdBu")
##D 
##D ## draw warm-colored index treemap
##D palette.HCL.options <- list(hue_start=270, hue_end=360+150)
##D treemap(business, 
##D         index=c("NACE1", "NACE2"),
##D         vSize="employees",
##D         type="index",
##D         palette.HCL.options=palette.HCL.options)
##D 
##D # terrain colors
##D business$employees.growth <- business$employees - business$employees.prev
##D treemap(business,
##D         index=c("NACE1", "NACE2"),
##D         vSize="employees",
##D         vColor="employees.growth",
##D         type="value",
##D         palette=terrain.colors(10))
##D 
##D # Brewer's Red-White-Grey palette reversed with predefined legend range
##D treemap(business,
##D         index=c("NACE1", "NACE2"),
##D         vSize="employees",
##D         vColor="employees.growth",
##D         type="value",
##D         palette="-RdGy",
##D         range=c(-20000,30000))
##D 
##D # More control over the color palette can be achieved with mapping
##D treemap(business,
##D         index=c("NACE1", "NACE2"),
##D         vSize="employees",
##D         vColor="employees.growth",
##D         type="value",
##D         palette="RdYlGn",
##D         range=c(-20000,30000),           # this is shown in the legend
##D         mapping=c(-30000, 10000, 40000)) # Rd is mapped to -30k, Yl to 10k, and Gn to 40k
## End(Not run)



