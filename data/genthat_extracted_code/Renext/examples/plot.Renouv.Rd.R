library(Renext)


### Name: plot.Renouv
### Title: Plot an object of class "Renouv"
### Aliases: plot.Renouv lines.Renouv

### ** Examples

## two fits for the Garonne data
fit.exp <- Renouv(x = Garonne, plot = FALSE)
fit.gpd <- Renouv(x = Garonne, distname.y = "gpd", plot = FALSE)

## simple plot (legend is TRUE here)
plot(fit.exp,
     main = "Two fits overlapped",
     label = "",
     ## Tlim = c(1, 5000),
     predict = TRUE)

## Now try 'lines' and RLlegend.xxx functions
plot(fit.exp,
     main = "Fancy legend",
     show = list(OT = FALSE, quant = FALSE, conf = FALSE,
                 OTS = FALSE, MAX = FALSE),
     legend = FALSE,
     Tlim = c(1, 5000))
RLlegend.ini(x = "bottomright", bg = "lightyellow") ## initialise legend
lines(fit.exp,
      show = list(quant = FALSE, conf = FALSE, OT = TRUE, MAX = TRUE),
      label = "expon",
      par = RLpar(quant.col = "orange", 
        OT.pch = 21, OT.cex = 1.2, OT.col = "SeaGreen", OT.bg = "yellow",
        MAX.block1.col = "purple", MAX.block1.bg = "mistyrose",
        MAX.block1.lwd = 1.4))
lines(fit.gpd,
      pct.conf = c(95, 70),
      show = list(quant = TRUE, conf = TRUE),
      label = "GPD",
      par = RLpar(quant.col = "darkcyan", conf.conf1.col = "red"))
RLlegend.show() ## now draw legend



