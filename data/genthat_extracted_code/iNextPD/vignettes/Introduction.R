## ---- include = FALSE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "", 
                      fig.retina=2,
                      fig.align='center',
                      fig.width = 7, fig.height = 5,
                      warning = FALSE, message = FALSE)
options("width"=200)
library(iNEXT)
library(ggplot2)
library(ade4)

## ----eval=FALSE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#  ## install iNEXT package from CRAN
#  install.packages("iNextPD")
#  
#  ## install the latest version from github
#  install.packages('devtools')
#  library(devtools)
#  install_github('JohnsonHsieh/iNextPD')
#  
#  ## import packages
#  library(iNextPD)
#  library(ggplot2)
#  library(ade4)

## ----eval=FALSE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#  iNextPD(x, labels, phy, q=0, datatype="abundance", size=NULL, endpoint=NULL, knots=40, se=FALSE, conf=0.95, nboot=50)

## ----include=FALSE------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
library(ade4)
library(iNextPD)

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
data(bird)
str(bird)
bird.lab <- rownames(bird$abun)
bird.phy <- ade4::newick2phylog(bird$tre)
# plot(bird.phy)
table.phylog(bird$abun, bird.phy, csize=4, f.phylog=0.7)

## ----eval=FALSE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#  iNextPD(x=bird$abun, labels=bird.lab, phy=bird.phy, q=0, datatype="abundance")

## ----eval=FALSE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#  # set a series of sample sizes (m) for R/E computation
#  m <- c(1, 5, 20, 50, 100, 200, 400)
#  iNextPD(x=bird$abun, labels=bird.lab, phy=bird.phy,
#          q=0, datatype="abundance", size=m)

## ----eval=FALSE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#  out <- iNextPD(x=bird$abun, labels=bird.lab, phy=bird.phy,
#          q=c(0,1,2), datatype="abundance", size=m)

## ----eval=FALSE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#  estimatePD(x, labels, phy, datatype="abundance", base="size",
#             level=NULL, conf=0.95, digits=4)

## ----include=FALSE------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
library(iNextPD)
data(bird)
bird.lab <- rownames(bird$abun)
bird.phy <- ade4::newick2phylog(bird$tre)

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
estimatePD(bird$abun, bird.lab, bird.phy, "abundance", 
           base="coverage", level=0.975, conf=0.95)

## ----eval=FALSE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#  ggiNEXT(x, type=1, se=TRUE, facet.var="none", color.var="site", grey=FALSE)

## ----eval=FALSE, warning=FALSE------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#  out <- iNextPD(bird$abun, bird.lab, bird.phy,
#                 q=c(0, 1, 2), datatype="abundance", endpoint=400)
#  
#  # Sample‐size‐based R/E curves, separating by "site""
#  ggiNEXT(out, type=1, facet.var="site")
#  ## Not run:
#  # Sample‐size‐based R/E curves, separating by "order"
#  ggiNEXT(out, type=1, facet.var="order")
#  # display black‐white theme
#  ggiNEXT(out, type=1, facet.var="order", grey=TRUE)
#  ## End(Not run)

## ----eval=FALSE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#  # Sample‐size‐based R/E curves, separating by "site""
#  ggiNEXT(out, type=1, facet.var="site")

## ----echo=FALSE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
out <- iNextPD(bird$abun, bird.lab, bird.phy,
               q=c(0, 1, 2), datatype="abundance", endpoint=400)
ggiNEXT(out, type=1, facet.var="site")

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ggiNEXT(out, type=1, facet.var="order", color.var="site")

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ggiNEXT(out, type=2, facet.var="none", color.var="site")

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ggiNEXT(out, type=3, facet.var="site")

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ggiNEXT(out, type=3, facet.var="order", color.var="site")

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
out.inc <- iNextPD(bird$inci, bird.lab, bird.phy, 
                   q=0, datatype="incidence_raw", 
                   endpoint = 25, se=TRUE)

# Sample‐size‐based R/E curves
ggiNEXT(out.inc, type=1, color.var="site") + 
  theme_bw(base_size = 18) + 
  theme(legend.position="none")

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Sample completeness curves
ggiNEXT(out.inc, type=2, color.var="site") +
  xlim(c(5,25)) + ylim(c(0.7,1)) +
  theme_bw(base_size = 18) + 
  theme(legend.position="none")

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Coverage‐based R/E curves
ggiNEXT(out.inc, type=3, color.var ="site") + 
  xlim(c(0.7,1)) +
  theme_bw(base_size = 18) +
  theme(legend.position="bottom",
        legend.title=element_blank())

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
out2 <- iNextPD(bird$abun, bird.lab, bird.phy,
               q=c(0, 1, 2), datatype="abundance", 
               endpoint=400, se=TRUE)
ggiNEXT(out2, type=3, facet.var="site") + 
  theme(legend.position="none")

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ggiNEXT(out2, type=1, facet.var="site") + 
  theme_bw(base_size = 18) +
  theme(legend.position="right")

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ggiNEXT(out2, type=1, facet.var="order", grey=TRUE)

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ggiNEXT(out2, type=1, facet.var="order") + 
  facet_wrap(~order, scales="free")

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ggiNEXT(out2, type=1, facet.var="site") +
  scale_shape_manual(values=c(19,19,19))

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
library(iNextPD)
library(ggplot2)
library(gridExtra)
data(bird)
bird.lab <- rownames(bird$abun)
bird.phy <- ade4::newick2phylog(bird$tre)
out <- iNextPD(bird$abun, bird.lab, bird.phy, q=0, 
               datatype="abundance", se=TRUE)
g <- ggiNEXT(out, type=1, color.var = "site")
g

## ----eval=FALSE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#  g1 <- g + scale_shape_manual(values=c(11, 12)) +
#            scale_linetype_manual(values=c(1,2))
#  g2 <- g + scale_colour_manual(values=c("red", "blue")) +
#            scale_fill_manual(values=c("red", "blue"))
#  
#  # Draw multiple graphical objec on a page
#  # library(gridExtra)
#  grid.arrange(g1, g2, ncol=2)

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# point is drawn on the 1st layer, default size is 5
gb3 <- ggplot_build(g)
gb3$data[[1]]$size <- 10
gt3 <- ggplot_gtable(gb3)

# use grid.draw to draw the graphical object
# library(grid)
# grid.draw(gt3)

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# line is drawn on the 2nd layer, default size is 1.5
gb4 <- ggplot_build(g)
gb4$data[[2]]$size <- 3
gt4 <- ggplot_gtable(gb4)
# grid.draw(gt4)

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
grid.arrange(gt3, gt4, ncol=2)

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
g5 <- g + theme_bw() + 
  theme(legend.position = "bottom", legend.box = "vertical")
g6 <- g + theme_classic() + 
  theme(legend.position = "bottom", legend.box = "vertical")
grid.arrange(g5, g6, ncol=2)

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
library(ggthemes)
g7 <- g + theme_hc(bgcolor = "darkunica") +
  theme(legend.box = "vertical") +
  scale_colour_hc("darkunica")

g8 <- g + theme_economist() + 
  theme(legend.box = "vertical") +
  scale_colour_economist()

grid.arrange(g7, g8, ncol=2)

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
g9 <- g + theme_bw(base_size = 18) +
      scale_fill_grey(start = 0, end = .4) +
      scale_colour_grey(start = .2, end = .2) +
      theme(legend.position="bottom",
            legend.title=element_blank(),
            legend.box = "vertical")

g10 <- g + theme_tufte(base_size = 12) +       
    scale_fill_grey(start = 0, end = .4) +
    scale_colour_grey(start = .2, end = .2) +
    theme(legend.position="bottom",
          legend.title=element_blank(),
          legend.box = "vertical")
grid.arrange(g9, g10, ncol=2)

## -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
df <- fortify(out, type=1)
head(df)

df.point <- df[which(df$method=="observed"),]
df.line <- df[which(df$method!="observed"),]
df.line$method <- factor(df.line$method, 
                         c("interpolated", "extrapolated"),
                         c("interpolation", "extrapolation"))
 
ggplot(df, aes(x=x, y=y, colour=site)) + 
  geom_point(aes(shape=site), size=5, data=df.point) +
  geom_line(aes(linetype=method), lwd=1.5, data=df.line) +
  geom_ribbon(aes(ymin=y.lwr, ymax=y.upr,
                  fill=site, colour=NULL), alpha=0.2) +
  labs(x="Number of individuals", y="Phylogenetic diversity") +
  theme(legend.position = "bottom", 
        legend.title=element_blank(),
        text=element_text(size=18),
        legend.box = "vertical") 

