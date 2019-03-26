library(nodiv)


### Name: Node_analysis
### Title: Calculate GND and SOS scores for a phylogeny and community data
###   set
### Aliases: Node_analysis nodiv_result print.nodiv_result
###   summary.nodiv_result print.summary_nodiv_result plot.nodiv_result
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(coquettes)
res <- Node_analysis(coquettes, 50, "rdtable")
par(mfrow = c(1,2))
plot(res)
plotSOS(res, 28, shapefill = terrain.colors(64))
summary(res)



