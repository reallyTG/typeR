library(rivervis)


### Name: RiverPoint
### Title: Points on River Charts
### Aliases: RiverPoint
### Keywords: hplot

### ** Examples

data(Ballinderry)

riverlayout <- RiverLayout(B.river$River,B.river$Length,
                           B.river$Parent,B.river$Position,
                           B.river$Distance, direction = -1)

RiverDraw(riverlayout)

RiverPoint(B.elevation$Site, B.elevation$River, B.elevation$Distance,
           B.elevation$Elevation, riverlayout)

RiverPoint(B.sitenh4n$Site, B.sitenh4n$River, B.sitenh4n$Distance,
           B.sitenh4n$NH4N_Spring, riverlayout, type = "o",
           pt.col = "#5381FFFF", pt.pch = 21, pt.bg = "lightblue")

RiverPoint(B.sitenh4n$Site, B.sitenh4n$River, B.sitenh4n$Distance,
           B.sitenh4n$NH4N_Autumn, riverlayout, type = "o",
           pt.col = "#FF3931FF", pt.pch = 21, pt.bg = "pink",
           lbl.shw = TRUE)



