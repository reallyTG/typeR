library(berryFunctions)


### Name: tableColVal
### Title: Table with values with value-dependent colored backgrounds in
###   pdf
### Aliases: tableColVal
### Keywords: hplot

### ** Examples


Bsp <- matrix(c(21,23,26,27, 18,24,25,28, 14,17,23,23, 16,19,21,25), ncol=4, byrow=TRUE)
colnames(Bsp) <- paste0("Measure", LETTERS[1:4])
rownames(Bsp) <- paste("prod", 8:11, sep="_")
Bsp

(  tableColVal(Bsp)   )
tableColVal(Bsp, nameswidth=0.1) # relative to plot width
tableColVal(Bsp, namesheight=0.5, srt=45)
tableColVal(Bsp, namesheight=0.5, colargs=c(srt=45))

tableColVal(Bsp, cellargs=list(cex=2), col="red")
tableColVal(Bsp, Range=c(10,40))
tableColVal(Bsp, Range=c(20,40))
tableColVal(Bsp, palette=heat.colors(12))
tableColVal(Bsp, palette=c(2,4,7), main="more\nstuff")

Bsp2 <- matrix(rexp(30), ncol=6, byrow=TRUE)
(  tableColVal(Bsp2)  )
tableColVal(Bsp2, digits=4)
colPointsLegend(Bsp2, horizontal=FALSE, x1=0.05, x2=0.15, y1=0.1, y2=0.8, title="")

## Not run: 
##D ## Rcmd check --as-cran doesn't like to open external devices such as pdf,
##D ## so this example is excluded from running in the checks.
##D pdf("TableColVal.pdf", height=5);  tableColVal(Bsp);  dev.off()
##D openFile("TableColVal.pdf")
##D unlink("TableColVal.pdf")
## End(Not run)




