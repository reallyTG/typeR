library(bipartite)


### Name: visweb
### Title: Plotting function to visualize a bipartite food web
### Aliases: visweb
### Keywords: package

### ** Examples


data(Safariland)
visweb(Safariland)
visweb(Safariland, type="diagonal", square="compartment", text="none", 
	frame=TRUE)
visweb(Safariland, type="nested", text="compartment")
visweb(Safariland, circles=TRUE,  boxes=FALSE,  labsize=1, circle.max=3, 
	text="no")
visweb(Safariland,square="b",box.col="green",box.border="red")

#define your colors here,length has to be the numbers of different entries
cols <-0:(length(table(Safariland))-1) 
visweb(Safariland, square="defined", def.col=cols) 



