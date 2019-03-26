## ----setup, include=FALSE------------------------------------------------

set.seed(42)

library(packcircles) 
library(ggplot2)

t <- theme_bw() + 
  theme(panel.grid = element_blank(), 
        axis.text=element_blank(),
        axis.ticks=element_blank(), 
        axis.title=element_blank())

theme_set(t)


## ------------------------------------------------------------------------

areas <- c(20, 10, 40, rep(5, 7))

# Generate the layout 
packing <- circleProgressiveLayout(areas) 

head( round(packing, 2) )


## ----fig.width=4, fig.height=4-------------------------------------------

dat.gg <- circleLayoutVertices(packing, npoints=50)

ggplot(data = dat.gg) + geom_polygon(aes(x, y, group = id), colour = "black", 
fill = "grey90", alpha = 0.7, show.legend = FALSE) +

geom_text(data = packing, aes(x, y), label = 1:nrow(packing)) +

coord_equal()


## ----fig.width=7, fig.height=5-------------------------------------------

ncircles <- length(areas) 
nreps <- 6

packings <- lapply(
  1:nreps, 
  function(i) { 
    x <- sample(areas, ncircles) 
    circleProgressiveLayout(x) 
  })

packings <- do.call(rbind, packings)

npts <- 50 
dat.gg <- circleLayoutVertices(packings, npoints = npts) 

dat.gg$rep <- rep(1:nreps, each = ncircles * (npts+1))


ggplot(data = dat.gg, aes(x, y)) + 
  geom_polygon(aes(group = id), 
               colour = "black", fill = "grey90") +

  coord_equal() +

  facet_wrap(~ rep, nrow = 2)


## ----fig.width=7, fig.height=4-------------------------------------------

areas <- 1:1000

# area: small to big
packing1 <- circleProgressiveLayout(areas)
dat1 <- circleLayoutVertices(packing1)

# area: big to small
packing2 <- circleProgressiveLayout( rev(areas) ) 
dat2 <- circleLayoutVertices(packing2)

dat <- rbind( 
  cbind(dat1, set = 1), 
  cbind(dat2, set = 2) )

ggplot(data = dat, aes(x, y)) + 
  geom_polygon(aes(group = id, fill = -id), 
               colour = "black", show.legend = FALSE) +
  
  scale_fill_distiller(palette = "RdGy") +
  
  coord_equal() +
  
  facet_wrap(~set, 
             labeller = as_labeller(
               c('1' = "small circles first", 
                 '2' = "big circles first"))
             )


## ------------------------------------------------------------------------

data("bacteria")
head(bacteria)


## ----fig.width=5, fig.height=5, fig.align='center'-----------------------

packing <- circleProgressiveLayout(bacteria)

dat.gg <- circleLayoutVertices(packing)

ggplot(data = dat.gg) +
  geom_polygon(aes(x, y, group = id, fill = factor(id)), 
               colour = "black",
               show.legend = FALSE) +
  
  scale_fill_manual(values = bacteria$colour) +
  
  scale_y_reverse() +
  
  coord_equal()


## ----fig.width=5, fig.height=5-------------------------------------------

library(ggiraph)

gg <- ggplot(data = dat.gg) +
  
  geom_polygon_interactive(
    aes(x, y, group = id, fill = factor(id),
        tooltip = bacteria$label[id], data_id = id), 
    colour = "black",
    show.legend = FALSE) +
  
  scale_fill_manual(values = bacteria$colour) +
  
  scale_y_reverse() +
  
  labs(title = "Hover over circle to display taxon name") +

  coord_equal()

ggiraph(ggobj = gg, width_svg = 5, height_svg = 5)


