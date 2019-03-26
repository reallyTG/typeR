library(rivervis)


### Name: rivervis-package
### Title: rivervis Package: River Visualisation Tool
### Aliases: rivervis rivervis-package
### Keywords: hplot

### ** Examples

data(Ballinderry)

riverlayout <- RiverLayout(B.river$River, B.river$Length, B.river$Parent,
                           B.river$Position, B.river$Distance, direction = -1)

# Example Figure 1

RiverDraw(riverlayout)
RiverLabel(riverlayout, offset = -1, corner = "lt", srt = 0, adj = c(0, -0.7))

RiverBar(B.siteaspt$Site, B.siteaspt$River, B.siteaspt$Distance,
         B.siteaspt[4:5], riverlayout, range = c(0,8),
         bar.col = c("#5381FFFF", "#FF3931FF"),lbl.adj = c(0.5,1.3))

RiverPoint(B.sitenh4n$Site, B.sitenh4n$River, B.sitenh4n$Distance,
           B.sitenh4n$NH4N_Spring, riverlayout, type = "o",
           pt.col = "#5381FFFF", pt.pch = 21, pt.bg = "lightblue")
RiverPoint(B.sitenh4n$Site, B.sitenh4n$River, B.sitenh4n$Distance,
           B.sitenh4n$NH4N_Autumn, riverlayout, type = "o",
           pt.col = "#FF3931FF", pt.pch = 21, pt.bg = "pink")

RiverSite(B.town$Town, B.town$River, B.town$Distance, B.town$Group,
          riverlayout, pt.pch = 22, lbl.shw = FALSE,
          pt.bg = "orange", pt.col = "black")

RiverSite(B.soi$SOI, B.soi$River, B.soi$Distance, B.soi$Group, riverlayout,
          pt.pch = c(25, 24, NA), lbl.shw = FALSE, pt.bg = NA, pt.col = "black")

RiverTM(c(0,2,4,6,8,10), B.siteaspt[4:5], riverlayout, pos=-1, side = "L",
        range = c(0,8), label = c(0,2,4,6,8))

RiverTM(c(0,0.04,0.08,0.12), B.sitenh4n[4:5], riverlayout, pos=-1, side = "R",
        range = c(0,0.15), label = c(0,0.04,0.08,0.12))

RiverAxisLabel("ASPT score", riverlayout, adj = c(0.5, -3))

RiverAxisLabel(expression(paste("N ",H[4],"-N (mg/L)")),
               riverlayout, side = "R",
               srt = 270, adj = c(0.5, -3))

legend(0.8, 0.43, inset=0.05, title = "Legend",
       c("ASPT Spring", "ASPT Autumn",
         expression(paste(NH[4],"-N Spring")),
         expression(paste(NH[4],"-N Autumn")),
         "Town", "Unshown left tribs",
         "Unshown right tribs"),
       lty = c(-1,-1,1,1,-1,-1,-1),
       pch = c(22,22, 21,21, 22, 25, 24),
       col= c("black", "black", "#5381FFFF", "#FF3931FF",
              "black", "black", "black"),
       pt.bg = c("#5381FFFF", "#FF3931FF", "lightblue",
                 "pink", "orange", NA, NA),
       pt.cex = c(2, 2, 1, 1, 1,1,1),
       cex = 0.8)

RiverScale(2, "2 km", riverlayout, loc = c(0.6, 0.10),lbl.cex = 0.8)

RiverDirection(riverlayout, arw.length = 0.03,
               loc = c(0.6, 0.05), lbl.cex = 0.8)

# Example Figure 2

RiverDraw(riverlayout)
RiverLabel(riverlayout, offset = -1, corner = "lt",
           srt = 0, adj = c(0, -0.7))

RiverReach(B.reach$Reach, B.reach$River, B.reach$From, B.reach$To,
           B.reach$Group, B.reach$Style, riverlayout, rea.lwd = 4,
           rea.lty = 3,rea.col = "#51B0A8FF")

RiverPoint(NA,B.elevation$River, B.elevation$Distance,
           B.elevation$Elevation, riverlayout)

RiverTM(c(0, 100, 200, 300, 400, 500), B.elevation[3], riverlayout,
        pos=-1, side = "R", range = c(0,500),
        label = c(0, 100, 200, 300, 400, 500))

RiverAxisLabel("Elevation (m)", riverlayout, side = "R",
               srt = 270, adj = c(0.5, -4))

RiverBlock(B.sitehm$Site, B.sitehm$River, B.sitehm$Distance,
           B.sitehm[4:9], riverlayout, c(1,1,2,2),
           block.col = fivecolours, lbl.adj = c(0.5,1.3),
           par.txt = c("ChanVeg", "ChanFlow", "BankVegLeft",
                       "Right", "RipLULeft", "Right"))

legend(0.8, 0.43, inset=0.05,title = "Legend",
       c("High", "Good", "Moderate", "Poor", "Bad",
         "Elevation", "Upper Ballinderry SAC"),
       pch = c(22,22,22,22,22,NA,22),
       pt.bg = c(fivecolours, "black","#51B0A8FF"),
       pt.cex = c(2,2,2,2,2,NA,3),
       lty = c(NA,NA,NA,NA,NA,1,NA),
       cex = 0.8)

RiverScale(2, "2 km", riverlayout, loc = c(0.6, 0.10),lbl.cex = 0.8)

RiverDirection(riverlayout, arw.length = 0.03,
               loc = c(0.6, 0.05), lbl.cex = 0.8)

# Figure 3

RiverBlockChart(B.sitehm$Site, B.sitehm$River, B.sitehm$Distance,
                B.sitehm[4:9],  c(1,1,2,2), mar = 0.15,
                site.ofs = 1, site.cex = 0.7,
                site.order = "R", block.col = fivecolours)

legend(0.88, 0.6, inset=0.05, title = "Legend",
       c("High", "Good", "Moderate", "Poor", "Bad"),
       border = rep("black", 5),
       fill = fivecolours,
       cex = 0.8)



