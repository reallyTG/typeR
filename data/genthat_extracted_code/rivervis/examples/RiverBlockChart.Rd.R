library(rivervis)


### Name: RiverBlockChart
### Title: River Block Chart Plotting
### Aliases: RiverBlockChart
### Keywords: hplot

### ** Examples

data(Ballinderry)

RiverBlockChart(B.sitehm$Site, B.sitehm$River, B.sitehm$Distance,
                B.sitehm[4:9],  c(1,1,2,2), mar = 0.15, site.ofs = 1,
                site.cex = 0.7, site.order = "R",
                block.col = fivecolours)

RiverBlockChart(B.sitehm$Site, B.sitehm$River, B.sitehm$Distance,
                B.sitehm[4:9],  c(1,1,2,2), mar = 0.15,
                site.ofs = 1, site.cex = 0.7,
                rvr.order = c("Rock", "Killymoon-Claggan", "Ballinderry",
                              "Ballymully", "Kildress", "Kingsmill",
                              "Lissan", "Tulnacross"),
                block.col = fivecolours)

RiverBlockChart(B.sitehm$Site, B.sitehm$River, B.sitehm$Distance,
                B.sitehm[4:9],  c(1,1,2,2), mar = 0.15, site.ofs = 1,
                site.cex = 0.7, site.order = "R",
                par.txt = c("ChanVeg", "ChanFlow", "BankVegLeft",
                            "Right", "RipLULeft", "Right"),
                block.col = fivecolours)



