## ---- echo = FALSE, message = FALSE--------------------------------------
library(heatmaply)
library(knitr)
knitr::opts_chunk$set(
   # cache = TRUE,
   dpi = 60,
  comment = "#>",
  tidy = FALSE)

# http://stackoverflow.com/questions/24091735/why-pandoc-does-not-retrieve-the-image-file
# < ! -- rmarkdown v1 -->


## ---- eval = FALSE-------------------------------------------------------
#  install.packages('heatmaply')

## ---- eval = FALSE-------------------------------------------------------
#  # You'll need devtools
#  install.packages.2 <- function (pkg) if (!require(pkg)) install.packages(pkg);
#  install.packages.2('devtools')
#  # make sure you have Rtools installed first! if not, then run:
#  #install.packages('installr'); install.Rtools()
#  
#  devtools::install_github("ropensci/plotly")
#  devtools::install_github('talgalili/heatmaply')
#  

## ------------------------------------------------------------------------
library("heatmaply")

## ------------------------------------------------------------------------
library(heatmaply)
heatmaply(mtcars)

## ------------------------------------------------------------------------
heatmaply(mtcars, xlab = "Features", ylab = "Cars", 
		main = "An example of title and xlab/ylab",
		margins = c(60,100,40,20))

## ------------------------------------------------------------------------
heatmaply(cor(mtcars), margins = c(40, 40),
          k_col = 2, k_row = 2,
          limits = c(-1,1))
# Better to use:
# heatmaply_cor(cor(mtcars), margins = c(40, 40),
#           k_col = 2, k_row = 2)


## ------------------------------------------------------------------------
heatmaply(mtcars, xlab = "Features", ylab = "Cars", 
          scale = "column",
		main = "Data transformation using 'scale'",
		margins = c(60,100,40,20))

## ------------------------------------------------------------------------
heatmaply(normalize(mtcars), xlab = "Features", ylab = "Cars", 
		main = "Data transformation using 'normalize'",
		margins = c(60,100,40,20))

## ------------------------------------------------------------------------
heatmaply(percentize(mtcars), xlab = "Features", ylab = "Cars", 
		main = "Data transformation using 'percentize'",
		margins = c(60,100,40,20))

## ------------------------------------------------------------------------

library(heatmaply)

heatmaply(is.na10(airquality), grid_gap = 1, 
          showticklabels = c(T,F),
            k_col =3, k_row = 3,
            margins = c(55, 30), 
            colors = c("grey80", "grey20"))
# Better to use:
# heatmaply_na(airquality, k_col =3, k_row = 3,
            # margins = c(55, 30))


# warning - using grid_color cannot handle a large matrix!
# airquality[1:10,] %>% is.na10 %>% 
#   heatmaply(color = c("white","black"), grid_color = "grey",
#             k_col =3, k_row = 3,
#             margins = c(40, 50)) 
# airquality %>% is.na10 %>% 
#   heatmaply(color = c("grey80", "grey20"), # grid_color = "grey",
#             k_col =3, k_row = 3,
#             margins = c(40, 50)) 
# 


## ------------------------------------------------------------------------
# divergent_viridis_magma <- c(rev(viridis(100, begin = 0.3)), magma(100, begin = 0.3))
# rwb <- colorRampPalette(colors = c("darkred", "white", "darkgreen"))
# library(RColorBrewer)
# # display.brewer.pal(11, "BrBG")
# BrBG <- colorRampPalette(brewer.pal(11, "BrBG"))
# Spectral <- colorRampPalette(brewer.pal(11, "Spectral"))

heatmaply(cor(mtcars), margins = c(40, 40),
          k_col = 2, k_row = 2,
          colors = BrBG,
          limits = c(-1,1))
# Better to use:
# heatmaply_cor(cor(mtcars), margins = c(40, 40),
#           k_col = 2, k_row = 2)


## ---- eval = FALSE-------------------------------------------------------
#  heatmaply(percentize(mtcars), margins = c(40, 130),
#            colors = heat.colors(100))

## ------------------------------------------------------------------------
heatmaply(mtcars, margins = c(40, 130), 
          scale_fill_gradient_fun = ggplot2::scale_fill_gradient2(low = "blue", high = "red", midpoint = 200, limits = c(0, 500)))


## ------------------------------------------------------------------------
# The default of heatmaply:
heatmaply(percentize(mtcars)[1:10,], margins = c(40, 130),
          seriate = "OLO")

## ------------------------------------------------------------------------
# Similar to OLO but less optimal (since it is a heuristic)
heatmaply(percentize(mtcars)[1:10,], margin = c(40, 130),
          seriate = "GW")

## ------------------------------------------------------------------------
# the default by gplots::heatmaply.2
heatmaply(percentize(mtcars)[1:10,], margins = c(40, 130),
          seriate = "mean")

## ------------------------------------------------------------------------
# the default output from hclust
heatmaply(percentize(mtcars)[1:10,],  margins = c(40, 130),
          seriate = "none")

## ------------------------------------------------------------------------

x  <- as.matrix(datasets::mtcars)

# now let's spice up the dendrograms a bit:
library(dendextend)

row_dend  <- x %>% dist %>% hclust %>% as.dendrogram %>%
   set("branches_k_color", k = 3) %>% set("branches_lwd", c(1,3)) %>%
   ladderize
#    rotate_DendSer(ser_weight = dist(x))
col_dend  <- x %>% t %>% dist %>% hclust %>% as.dendrogram %>%
   set("branches_k_color", k = 2) %>% set("branches_lwd", c(1,2)) %>%
   ladderize
#    rotate_DendSer(ser_weight = dist(t(x)))

heatmaply(percentize(x), Rowv = row_dend, Colv = col_dend)



## ------------------------------------------------------------------------
x  <- as.matrix(datasets::mtcars)
gplots::heatmap.2(x, trace = "none", col = viridis(100), key = FALSE)

## ---- eval = FALSE-------------------------------------------------------
#  library(heatmaply)
#  heatmaply(x, seriate = "mean")

## ------------------------------------------------------------------------
library(heatmaply)
heatmaply(x, seriate = "mean", 
          row_dend_left = TRUE, plot_method = "plotly",
          margins = c(40,NA,NA,NA))

## ------------------------------------------------------------------------
# Example for using RowSideColors

x  <- as.matrix(datasets::mtcars)
rc <- colorspace::rainbow_hcl(nrow(x))

library(gplots)
library(viridis)
heatmap.2(x, trace = "none", col = viridis(100),
          RowSideColors=rc, key = FALSE)


## ---- eval = FALSE-------------------------------------------------------
#  heatmaply(x, seriate = "mean",
#            RowSideColors=rc)
#  
#  # heatmaply(x, seriate = "mean",
#  #           RowSideColors=factor(rc))
#  
#  

## ------------------------------------------------------------------------
heatmaply(x[,-c(8,9)], seriate = "mean",
          col_side_colors = c(rep(0,5), rep(1,4)),
          row_side_colors = x[,8:9])


## ---- eval = FALSE-------------------------------------------------------
#  
#  # library(microbenchmark)
#  #
#  #
#  # library(heatmaply)
#  # x <- matrix(1:1000, 500, 2)
#  #
#  # microbenchmark(
#  #   heatmaply(x, hclustfun = stats::hclust),
#  #   heatmaply(x, hclustfun = fastcluster::hclust),
#  #   times = 10
#  # )
#  #
#  # x <- matrix(1:1000, 1000, 2)
#  # microbenchmark(
#  #   stats::hclust(dist(x)),
#  #   fastcluster::hclust(dist(x)),
#  #   times = 10
#  # )
#  
#  

## ---- eval = FALSE-------------------------------------------------------
#  dir.create("folder")
#  library(heatmaply)
#  heatmaply(mtcars, file = "folder/heatmaply_plot.html")
#  browseURL("folder/heatmaply_plot.html")

## ---- eval = FALSE-------------------------------------------------------
#  dir.create("folder")
#  library(heatmaply)
#  # Before the first time using this code you may need to first run:
#  # webshot::install_phantomjs()
#  heatmaply(mtcars, file = "folder/heatmaply_plot.png")
#  browseURL("folder/heatmaply_plot.png")

## ---- eval = FALSE-------------------------------------------------------
#  # This saves the file, but does not plot it in the RStudio viewer
#  tmp <- heatmaply(mtcars, file = "folder/heatmaply_plot.png")
#  rm(tmp)

## ---- cache=FALSE--------------------------------------------------------
sessionInfo()

