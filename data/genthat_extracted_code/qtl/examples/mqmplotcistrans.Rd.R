library(qtl)


### Name: mqmplot.cistrans
### Title: cis-trans plot
### Aliases: mqmplot.cistrans
### Keywords: hplot

### ** Examples

data(multitrait)
## Don't show: 
multitrait <- subset(multitrait, chr=1,
                               ind=!apply(multitrait$pheno,
                                          1, function(a) any(is.na(a))))
## End(Don't show)
data(locations)
multiloc <- addloctocross(multitrait,locations)
multiloc <- calc.genoprob(multiloc)
results <- scanall(multiloc, method="hk")
mqmplot.cistrans(results, multiloc, 5, FALSE, TRUE)



