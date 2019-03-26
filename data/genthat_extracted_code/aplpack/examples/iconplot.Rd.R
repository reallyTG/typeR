library(aplpack)


### Name: iconplot
### Title: Icon Plots for Visualization of Contingency Tables
### Aliases: iconplot
### Keywords: graphics

### ** Examples

# HairEyeColor data, grouping by color
iconplot(HairEyeColor, 
         grp.color         = 1, 
         grp.xy            = NULL, 
         colors            = c("black", "brown", "red", "gold"),
         icon.space.factor = 0, 
         icon.aspect       = 2,
         main = "grouping by color")
# HairEyeColor data, grouping by color and symbols
iconplot(HairEyeColor, 
         grp.icon          = "Sex", 
         grp.color         = "Hair", 
         grp.xy            = NULL, 
         colors            = c("black", "brown", "red", "gold"),
         icons             = 18:17,
         icon.frame        = FALSE, 
         lab.cex           = 0.8, 
         icon.space.factor = 0, 
         lab.parallel      = !FALSE,
         main = "grouping by color and icons")
# HairEyeColor data, grouping by x and color
iconplot(HairEyeColor, 
         grp.xy            = "0 ~ 1", 
         grp.color         = 2, 
         colors            = c("black", "brown", "red", "gold"),
         icon.stack.type   = "tr", 
         icon.space.factor = c(0, 0.4), 
         lab.cex           =0.7, 
         main = "grouping by x and by colors")
# 2-dim, 1 split in y, 1 split in x, grouping by color
iconplot(HairEyeColor, 
         grp.xy          = "1 ~ 3", 
         grp.color       = 2, 
         colors          = c("brown", "blue", "brown3", "green"),
         panel.frame     = FALSE,
         icon.stack.type = "bl",
         lab.cex         = 0.7, 
         main = "grouping by x and y and by colors")
# 3-dim, 2 splits in x, 1 split in x, margin labs on the right
iconplot(HairEyeColor, 
         grp.xy             = "2 ~ 1 + 3 ", 
         grp.color          = 2, 
         panel.space.factor = c(0, .1), 
         panel.margin       = c(.05,.03,.03,.01),
         icon.stack.type    = "lb", 
         icon.stack.len     = 7, 
         icon.frame         = FALSE,
         icon.space.factor  = .0, 
         lab.parallel       = c(TRUE, FALSE), 
         lab.color          = c("lightblue","green"),
         lab.side           = "br", 
         lab.boxes          = 0.2, 
         lab.type           = "compact", 
         lab.cex            = 0.8, 
         main = "grouping: 2~1+3 and by color, margin labs variations")
# 3-dim, 3 splits in y, icon.aspect = NA
iconplot(HairEyeColor, 
         grp.xy             = "3 + 2 ~ 1", 
         grp.color          = 3, 
         panel.margin       = 0, 
         panel.space.factor = 0.1, 
         icon.stack.type    = "lb", 
         icon.horizontal    = TRUE, 
         icon.stack.len     = 5, 
         icon.space.factor  = c(.1, .3), 
         icon.aspect        = NA, 
         icon.frame         = FALSE,
         lab.boxes          = 0.3, 
         lab.color          = "grey", 
         lab.side           = "tl",
         lab.parallel       = TRUE, 
         lab.cex            = 0.7, 
         lab.type           = "compact", 
         main = "grouping: 3 + 2 ~ 1 and by color")
# 3-dim, plotting characters as icons
data <- as.table(array(0:23, 2:4))
iconplot(data, 
         grp.xy          = 1 + 2 ~ 3, 
         grp.color       = 3, 
         grp.icon        = 2,
         icon.aspect     = 2, 
         icon.horizontal = TRUE, 
         icons           = 15:18,
         icon.stack.type = c("lb", "lt", "rb","rt")[3], 
         icon.frame      = FALSE,
         lab.cex         = .6, 
         lab.type        = "compact", 
         main = "1+2 ~ 3")
# 3-dim contingency table: panels of different sizes, 1 split in y, 2 in x
# packer numbers
## No test: 
  ## because of computation time
iconplot(Titanic, 
         grp.xy             = 1~3+2, 
         grp.color          = 1, 
         packer             = c("icons", "numbers"), 
         panel.prop.to.size = 0.5, 
         panel.frame        = !TRUE, 
         panel.margin       = .01, 
         icon.aspect        = 0.15, 
         icon.stack.type    = "lt", 
         icon.space.factor  = 0.0,
         icon.frame         = FALSE,
         lab.side           = c("bl","br","tl","tr")[1], 
         lab.type           = "compact", 
         lab.cex            = 0.8, 
         lab.boxes          = 1.1, 
         lab.color          = "lightgreen",
         lab.parallel       = TRUE, 
         main = "different sizes of panels")
## End(No test)
# 3-dim contingency table: panels of different sizes, 3 splits in y
## No test: 
  ## because of computation time
iconplot(Titanic, 
         grp.xy             = "4 + 3 + 1 ~ 0" , 
         grp.color          = 4, 
         colors             = c("green", "red"), 
         packer             = c("icons", "numbers"), 
         panel.frame        = FALSE, 
         panel.margin       = .01,
         panel.prop.to.size = .3, 
         panel.space.factor = 0.05, 
         panel.reverse.y    = TRUE,
         icon.space.factor  = 0.5, 
         lab.side           = "l", 
         lab.type           = "compact",
         lab.parallel       = c(FALSE, TRUE), 
         lab.cex            = 0.7,
         main = "Titanic data, different sizes of panels")
## End(No test)
#  3-dim contingency table: panels of different sizes 
## No test: 
  ## because of computation time
iconplot(Titanic, 
         grp.xy             = "0 ~ 4 + 3 + 1 " , 
         grp.color          = 4, 
         colors             = c("green", "red"), 
         panel.frame        = FALSE, 
         panel.margin       = .01,
         panel.prop.to.size = .2, 
         panel.space.factor = 0.05, 
         panel.reverse.y    = TRUE,
         icon.space.factor  = 0.5, 
         lab.side           = "b", 
         lab.type           = "compact", 
         lab.boxes          = 0.2, 
         lab.parallel       = c(FALSE, TRUE), 
         lab.cex            = 0.6,
         lab.color          = c("lightblue"),
         main = "Titanic data, different widths of panels")
## End(No test)
# 3-dim contingency table: panels of different sizes, 3 splits in x 
## No test: 
  ## because of computation time
iconplot(Titanic, 
         grp.xy             = 3 + 2 ~ 1, 
         grp.color          = 2, 
         panel.prop.to.size = 0.66,
         icon.space.factor  = 0.4, 
         panel.space.factor = 0.1,
         lab.type           = "c", 
         lab.cex            = 0.7, 
         lab.boxes          = 1.2,
         lab.color          = c("lightblue"),
         main = "Titanic: panel.prop.to.size = 0.66")
## End(No test)
# comparing iconplot and mosaic plot
# par(mfrow = 2:1)
iconplot(HairEyeColor, 
         grp.xy             = 2 ~ 1 + 3 , 
         lab.parallel       = c(TRUE, TRUE),
         colors             = "red", 
         panel.reverse.y    = TRUE, 
         panel.prop.to.size = TRUE,
         icon.space.factor  = 0.5, 
         icon.aspect        = 2,
         lab.cex            = .6, 
         lab.boxes          = 1, 
         lab.color          = "grey", 
         # lab.side           = "lt", 
         panel.margin       = c(0.00,.035,0.0,.050),
         main = 'HairEyeColor: grp.xy = 2 ~ 1 + 3')
mosaicplot(HairEyeColor)
# par(mfrow = c(1,1))
# relative frequences 
data <- as.table(Titanic / max(Titanic))
iconplot(data, 
         grp.xy             = 1 ~ 2 + 3, 
         grp.color          = 4, 
         panel.frame        = FALSE, 
         panel.space.factor = 0.05, 
         icon.horizontal    = !TRUE, 
         icon.space.factor  = 0.103, 
         icon.stack.type    = "b",
         icon.aspect        = 0.5,
         main = "Titanic: relative frequencies", colors = c("black", "green"))
# negative and fractional cell entries
## No test: 
  ## because of computation time
data <- HairEyeColor; Exp <- margin.table(data, 1)
for( d in 2:length(dim(data)) ){
  Exp <- outer( Exp, margin.table(data, d) ) / sum(data)
}
Diff <- Exp - data
cat("observed:\n"); print(data)
cat("expected:\n"); print(round(Exp, 3))
cat("deviation: expected - observed:\n"); print(round(Diff,3))
iconplot(Diff, 
         grp.xy          = 1 + .sign ~ 2 + 3, 
         grp.color       = ".sign", 
         colors          = c( "red", "green"),
         panel.reverse.y = TRUE, 
         panel.frame     = FALSE,
         icon.stack.type = c("t","b"), 
         lab.boxes       = 1.2,  
         lab.color       = "lightgreen",
         main = "deviations from expectation: HairEyeColor")
## End(No test)
# relative differences of expectations, split according sign
data <- margin.table(Titanic, c(2,1,4)); pT <- prop.table(data)
eT <- outer(outer(margin.table(pT,1), margin.table(pT,2)), margin.table(pT,3))
data <- as.table(pT - eT); data <- data / max(data)
iconplot(data, 
         grp.xy = Survived + Sex + .sign ~ Class, 
         grp.color          = ".sign", 
         panel.frame        = FALSE, 
         panel.reverse.y    = TRUE, 
         panel.space.factor = 0.05, 
         icon.horizontal    = !TRUE, 
         icon.stack.type    = rep(c("t","b"), 2), 
         icon.aspect        = 2, 
         icon.space.factor  = 0.1, 
         lab.boxes          = 1.2, 
         lab.color          = "lightgrey",
         main = "Titanic: difference to expectation")
# using a foto as icon, rentals of flats in Goettingen 2015/12
rentels <- 
 structure(list(Rooms = c(2, 3, 2, 2, 3, 2, 2, 3, 2, NA, 2, 2,            
 3, 4, 4, NA, 3, 2, 3, 2, 4, 2, 1, 2), qm = c(43.13, 86, 48, 66.62,        
 76, 49, 59, 97, 45, 87, 46.39, 71, 65, 100, 75, 178, 94.07, 56,           
 97, 70, 132, 43, 24, 48), Eur = c(365, 480, 480, 660, 500, 410,           
 440, 1200, 450, 696, 420, 710, 747.5, 1300, 450, 990, 900, 520,           
 1020, 1005, 924, 610, 375, 420)), class = "data.frame", 
 row.names = c(NA, 24L)) 
fname <- system.file("src", "tm1.jpg", package="aplpack") # fname <- "tm1.jpg" 
print(fname)
iconplot(rentels, 
         grp.xy              = Eur ~ qm, 
         vars.to.factors     = c(1, .5, .3),
         panel.frame         = FALSE, 
         panel.space.factor  = 0.2,
         panel.prop.to.size  = 0.7,
         icons               = fname, 
         icon.frame          = FALSE, 
         icon.space.factor   = 0.05,
         lab.parallel        = c(TRUE, TRUE), 
         lab.legend          = "cols",
         main = "rentels of flats in Goettingen 2015/12")
# size by .fractions, color by rooms
data <- cbind(rentels, .fraction = (rentels[,3] / max(rentels[,3]))^.5)
iconplot(data, 
         grp.xy             = Eur ~ qm, 
         grp.color          = Rooms, 
         vars.to.factors    = c(1,.5, .3),
         panel.frame        = FALSE,
         panel.space.factor = 0.1,
         panel.prop.to.size = 0.7,
         icons              = fname,
         icon.stack.type    = "s",  
         icon.frame         = FALSE,
         icon.space.factor  = 0.05, 
         lab.cex            = 0.8,
         main               = "size fby .fractions, color by rooms")
# jpg files as icons 
## No test: 
  ## because of computation time
data <- as.table(Titanic[2:3,,,,drop=FALSE]) / 10
fname1 <- system.file("src", "walkman-r.jpg", package="aplpack") # fname1 <- "walkman-r.jpg"
fname2 <- system.file("src", "pw-esch.jpg", package="aplpack")   # fname2 <- "pw-esch.jpg"
p.set <- c(fname1, fname2)
iconplot(data, 
         grp.xy             = 2 ~ 3+1, 
         grp.color          = 1, 
         grp.icon           = 3, 
         icons              = p.set, 
         colors             = c("blue", "green"),
         panel.space.factor = 0.05, 
         panel.prop.to.size = c(.5, .5, 1),
         icon.aspect        = 1, 
         icon.space.factor  = .10, 
         icon.horizontal    = TRUE, 
         icon.draft         = FALSE,
         icon.stack.type    = c("lb", "lt", "rb","rt")[1], 
         icon.grey.levels   = list(2, 10), 
         lab.side           = "t", lab.cex = .7, 
         main = "walkman and pw icons, scaled subset of Titanic")
## End(No test)
# files of different types as icons
## No test: 
  ## because of computation time
fname3 <- system.file("src", "pw-esch.ppm", package="aplpack") # fname3 <- "pw-esch.ppm"
fname4 <- system.file("src", "pw-esch.png", package="aplpack") # fname4 <- "pw-esch.png"
p.set <- c(fname2, fname3, fname4)
iconplot(trees, 
         grp.xy             = Girth ~ Height, 
         grp.icon           = Height, 
         grp.color          = Volume, 
         vars.to.factors    = c(Volume = 4, Girth = 3, Height = 3), 
         panel.space.factor = 0.05, 
         panel.prop.to.size = c(.7, .45),
         panel.frame        = FALSE,
         icons              = p.set, 
         icon.cex           = 14,
         icon.grey.levels = 6, icon.space.factor   = 0.05 )
## End(No test)
# using raster graphics objects as icons
data <- as.table(Titanic[1:2,,,,drop=FALSE])/10
image1 <- as.raster(  matrix( c(1,0,1,1,0,1,1,0,1), ncol = 3, nrow = 3))
image2 <- as.raster(  matrix( c(1,0,1,0,0,0,1,0,1), ncol = 3, nrow = 3))
iconplot(data, 
         grp.xy            = 2 ~ 4+1, 
         grp.color         = 1, 
         grp.icon          = 4, 
         colors            = c("blue", "green"), 
         icons             = list(image1, image2),
         icon.aspect       = 1,    
         icon.space.factor = .10, 
         icon.horizontal   = TRUE, 
         icon.draft        = FALSE,
         icon.stack.type   = c("lb", "lt", "rb","rt")[1], 
         icon.grey.levels  = list(2, 10), 
         lab.side = "t", lab.cex = .7, main = "some Titanic data")
# using internal generator "fir.tree"
## No test: 
  ## because of computation time
data <- trees
iconplot(data, 
         grp.color          = 3, 
         grp.xy             = 1 ~ 2, 
         vars.to.factor     = c(5, 5, 8), 
         icons              = "fir.tree", 
         colors             = rainbow(8, start = .1, end = .5), 
         icon.frame         = FALSE, 
         lab.legend         = 2, 
         lab.cex            = 0.7, 
         main = "grouping by vars and by colors")
## End(No test)
# using different internal generators
data <- trees
iconplot(data, 
         grp.color          = 1, 
         grp.xy             = 1 ~ 2, 
         grp.icon           = 2, 
         colors             = c("orange", "green", "orange", "red"), 
         icons = c("nabla", "BI", "walkman", "car.simple", "bike", "circle"), 
         vars.to.factor     = c(3,6), 
         lab.legend         = 2, 
         lab.cex            = 0.7, 
         main = "grouping by vars, by icons and by colors")
# Traveller plot proposed by M. Mazziotta and A. Pareto
Mazzi.Pareto <- 
 structure(list(Region = c("Piemonte", "Valle d'Aosta", "Lombardia",  
 "Trentino-Alto Adige", "Veneto", "Friuli-Venezia Giulia", "Liguria", 
 "Emilia-Romagna", "Toscana", "Umbria", "Marche", "Lazio", "Abruzzo", 
 "Molise", "Campania", "Puglia", "Basilicata", "Calabria", "Sicilia", 
 "Sardegna"), Mean = c(98.74, 104.07, 101.38, 106.1, 104.38, 105.55,  
 102.76, 103.62, 101.84, 103.52, 102.05, 97.88, 102.9, 91.43,         
 94.12, 96.78, 93.55, 92.59, 96.29, 100.45), Penalty = c(0.43,        
 4.23, 0.64, 0.63, 0.77, 0.34, 0.29, 0.46, 0.27, 0.22, 0.15, 0.82,    
 1.3, 1.02, 0.37, 0.21, 2.37, 0.51, 0.31, 0.76), MPI = c(98.3,        
 99.84, 100.74, 105.47, 103.61, 105.21, 102.47, 103.16, 101.57,       
 103.3, 101.9, 97.06, 101.6, 90.42, 93.75, 96.58, 91.18, 92.08,       
 95.98, 99.69)), .Names = c("Region", "Mean", "Penalty", "MPI"        
 ), row.names = c(NA, -20L), class = "data.frame")
dm <- cbind(Mazzi.Pareto, 
            col = as.factor(rep(1:4, 5)),        # as.factor!! 
            row = as.factor(rep(1:5, each = 4))) # as.factor!!
iconplot(dm, verbose = !TRUE, x.text = 60,  y.text = -10,  #t3s
         grp.xy            = row ~ col,
         grp.icon          = 0 + Mean +  Penalty + Region, 
         vars.to.factor    = FALSE,
         icons             = "mazz.man",
         panel.reverse.y   = TRUE,
         icon.space.factor = 0,
         icon.frame        = FALSE,
         lab.parallel      = TRUE,
         lab.side          = c("",""),
         main = "Traveller plot")
# definition of a check list, tally or 'Krebholz'
check.list <- function(x, colors = rainbow(length(x))){
  num.split <- function(x, div = 5){
    x.name <- as.character(substitute(x))
    xn <- lapply( x, function(x) 
       c(rep(div, x %/% div), if( 0 < ( h <- x %% div) ) h )
    )
    len <- max(sapply(xn, length))
    xn <- lapply( xn, function(x) c(x, rep(0, len - length(x) )))
    xn <- matrix( unlist(xn), ncol = len, byrow = TRUE )
    xn <- as.table(xn)
    dimnames(xn) <- list( seq( along = x ), 1:len)
    names(dimnames(xn)) <- c(x.name, "Blocks")
    xn
  }
  x.split <- num.split(x)
  rownames(x.split) <- paste(sep = ":", 1:length(x), x)
  iconplot(x.split, 
           grp.xy             = 1 ~ 2,  
           grp.col            = 1, 
           colors             = colors,
           panel.space.factor = c(0.4, 0.3), 
           panel.frame        = FALSE, 
           icon.stack.len     = 5, 
           icon.space.factor  = c(0.4, 0), 
           icon.asp           = NA, 
           icon.frame         = FALSE,
           lab.side           = "l", 
           lab.cex            = 0.7,
           main = paste("score of", substitute(x)))
  x.split
}
set.seed(13); data <- sample(1:50, size = 15)
check.list(data)



