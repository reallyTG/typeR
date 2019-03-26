library(heatmaply)


### Name: heatmaply
### Title: Cluster heatmap based on plotly
### Aliases: heatmaply heatmaply_na heatmaply_cor heatmaply.default
###   heatmaply.heatmapr

### ** Examples


## Not run: 
##D 
##D # mtcars
##D # x <- heatmapr(mtcars)
##D library(heatmaply)
##D heatmaply(iris[,-5], k_row = 3, k_col = 2)
##D heatmaply(cor(iris[,-5]))
##D heatmaply(cor(iris[,-5]), limits = c(-1,1))
##D heatmaply(mtcars, k_row = 3, k_col = 2)
##D # heatmaply(mtcars, k_row = 3, k_col = 2, grid_color = "white")
##D heatmaply(mtcars, k_row = 3, k_col = 2, grid_gap = 1)
##D 
##D # make sure there is enough room for the labels:
##D heatmaply(mtcars, margins = c(40, 130))
##D # this is the same as using:
##D heatmaply(mtcars) %>% layout(margin = list(l = 130, b = 40))
##D 
##D # control text angle
##D heatmaply(mtcars, column_text_angle = 90, margins = c(40, 130))
##D # the same as using srtCol:
##D # heatmaply(mtcars, srtCol = 90) %>% layout(margin = list(l = 130, b = 40))
##D 
##D 
##D 
##D x <- mtcars
##D # different colors
##D heatmaply(x, colors = heat.colors(200))
##D # using special scale_fill_gradient_fun colors
##D heatmaply(x, scale_fill_gradient_fun = scale_color_gradient())
##D 
##D 
##D # We can join two heatmaps together:
##D library(heatmaply)
##D hm1 <- heatmaply(mtcars, margins = c(40, 130))
##D hm2 <- heatmaply(mtcars, scale = "col", margins = c(40, 130))
##D subplot(hm1, hm2, margin = .2)
##D 
##D # If we want to share the Y axis, then it is risky to keep any of the dendrograms:
##D library(heatmaply)
##D hm1 <- heatmaply(mtcars, Colv = FALSE, Rowv = FALSE, margins = c(40, 130))
##D hm2 <- heatmaply(mtcars, scale = "col" , Colv = FALSE, Rowv = FALSE,
##D              margins = c(40, 130))
##D subplot(hm1, hm2, margin = .02, shareY = TRUE)
##D 
##D 
##D # We can save heatmaply as an HTML file by using:
##D heatmaply(iris[,-5], file = "heatmaply_iris.html")
##D # or a png/pdf/jpeg file using:
##D heatmaply(iris[,-5], file = "heatmaply_iris.png")
##D # or just doing it in one go:
##D heatmaply(iris[,-5], file = c("heatmaply_iris.html", "heatmaply_iris.png") )
##D 
##D 
##D 
##D # If we don't want the HTML to be selfcontained, we can use the following:
##D library(heatmaply)
##D library(htmlwidgets)
##D heatmaply(iris[,-5]) %>%
##D    saveWidget(file="heatmaply_iris.html",selfcontained = FALSE)
##D 
##D 
##D # Example for using RowSideColors
##D 
##D x  <- as.matrix(datasets::mtcars)
##D rc <- colorspace::rainbow_hcl(nrow(x))
##D 
##D library(gplots)
##D library(viridis)
##D heatmap.2(x, trace = "none", col = viridis(100),
##D           RowSideColors=rc)
##D 
##D heatmaply(x, seriate = "mean",
##D           RowSideColors=rc)
##D 
##D 
##D heatmaply(x[,-c(8,9)], seriate = "mean",
##D           col_side_colors = c(rep(0,5), rep(1,4)),
##D           row_side_colors = x[,8:9])
##D heatmaply(x[,-c(8,9)], seriate = "mean",
##D           col_side_colors = data.frame(a=c(rep(0,5), rep(1,4))),
##D           row_side_colors = x[,8:9])
##D 
##D 
##D ## Example of using Rowv And Colv for custumized dendrograms.
##D 
##D 
##D x  <- as.matrix(datasets::mtcars)
##D 
##D # now let's spice up the dendrograms a bit:
##D library(dendextend)
##D 
##D row_dend  <- x %>% dist %>% hclust %>% as.dendrogram %>%
##D   set("branches_k_color", k = 3) %>% set("branches_lwd", 4) %>%
##D   ladderize
##D #    rotate_DendSer(ser_weight = dist(x))
##D col_dend  <- x %>% t %>% dist %>% hclust %>% as.dendrogram %>%
##D   set("branches_k_color", k = 2) %>% set("branches_lwd", 4) %>%
##D   ladderize
##D #    rotate_DendSer(ser_weight = dist(t(x)))
##D 
##D heatmaply(x, Rowv = row_dend, Colv = col_dend)
##D 
##D 
##D heatmaply(is.na10(airquality))
##D heatmaply(is.na10(airquality), grid_gap = 1)
##D 
##D # grid_gap can handle quite large data matrix
##D heatmaply(matrix(1:10000,100,100), k_row = 3, k_col = 3, grid_gap = 1)
##D 
##D # Examples of playing with font size:
##D heatmaply(mtcars, fontsize_col = 20, fontsize_row = 5, margin = c(100,90))
##D 
##D 
##D 
##D # Example for using subplot_width/subplot_height
##D 
##D heatmaply(percentize(mtcars),
##D      subplot_widths=c(0.6, 0.4),
##D      subplot_heights=c(0.05, 0.95))
##D 
##D 
##D 
##D # Example of removing labels and thus making the plot faster
##D heatmaply(iris, showticklabels = c(T,F), margins = c(80,10))
##D 
##D # this is what allows for a much larger matrix to be printed:
##D set.seed(2017-05-18)
##D large_x <- matrix(rnorm(19), 1000,100)
##D heatmaply(large_x, dendrogram = F, showticklabels = F, margins = c(1,1))
##D 
##D 
## End(Not run)
## Not run: 
##D heatmaply_na(airquality)
## End(Not run)
## Not run: 
##D heatmaply_cor(cor(mtcars))
## End(Not run)



