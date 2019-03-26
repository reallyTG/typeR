library(RcmdrMisc)


### Name: plotMeans
### Title: Plot Means for One or Two-Way Layout
### Aliases: plotMeans
### Keywords: hplot

### ** Examples

if (require(car)){
    data(Moore)
    with(Moore, plotMeans(conformity, fcategory, partner.status, ylim=c(0, 25)))
}



