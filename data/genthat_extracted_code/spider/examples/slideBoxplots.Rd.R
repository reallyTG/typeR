library(spider)


### Name: slideBoxplots
### Title: Boxplots across windows
### Aliases: slideBoxplots
### Keywords: Sliding window

### ** Examples


data(dolomedes)
doloDist <- ape::dist.dna(dolomedes)
doloSpp <- substr(dimnames(dolomedes)[[1]], 1, 5)

doloNonCon <- slideBoxplots(dolomedes, doloSpp, 200, interval=10)
graphics::plot(doloNonCon)

doloOverall <- slideBoxplots(dolomedes, doloSpp, 200, interval=10, method="overall")
graphics::plot(doloOverall)

doloInterall <- slideBoxplots(dolomedes, doloSpp, 200, interval=10, method="interAll")
graphics::plot(doloInterall)




