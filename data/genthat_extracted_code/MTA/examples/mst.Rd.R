library(MTA)


### Name: mst
### Title: Multiscalar Typology
### Aliases: mst

### ** Examples

data("GrandParisMetropole")
synthesis <- mst(spdf = com.spdf,
                        x = com,
                        spdfid = "DEPCOM",
                        xid = "DEPCOM",
                        var1 = "INC",
                        var2 = "TH",
                        dist = NULL,
                        key = "EPT",
                        order = 1,
                        mat = NULL,
                        threshold = 125,
                        superior = TRUE)

if(require('cartography')){
  library(sp)
  par(mar = c(0,0,1.2,0))
  typoLayer(spdf = com.spdf, df = synthesis, var = "mst",
            border = "#D9D9D9",legend.values.order = 0:7, 
            col = c("#f0f0f0", "#fdc785","#ffffab","#fba9b0",
                    "#addea6","#ffa100","#fff226","#e30020"),
            lwd = 0.25,
            legend.pos = "n")
  
  plot(ept.spdf,add=TRUE)
  
  colours <- c("#f0f0f0", "#fdc785","#ffffab","#fba9b0",
               "#addea6","#ffa100","#fff226","#e30020")
  
  rVal<-c(" .     .   . ",
          "[X]   .   . ",
          " .   [X]  . ",
          "[X] [X]  . ",
          " .    .   [X]",
          "[X]  .   [X]",
          " .   [X] [X]",
          "[X] [X] [X]")
  
  legendTypo(col = colours, categ = rVal,
             title.txt = "General, territorial and spatial\ndeviations above 125 %
             \n       G T S",
             nodata = FALSE)
  
  layoutLayer(title = "Multiscalar Typology",
              sources = "GEOFLA® 2015 v2.1, Apur, impots.gouv.fr",
              author = "MTA")
}



