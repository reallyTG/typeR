## ------------------------------------------------------------------------

set.seed(42)

ncircles <- 200
limits <- c(-40, 40)
inset <- diff(limits) / 3
maxarea <- 40

areas <- rbeta(ncircles, 1, 5) * maxarea


## ------------------------------------------------------------------------
library(packcircles)

res <- circleRepelLayout(areas, xlim = limits, ylim = limits)

cat(res$niter, "iterations performed")


## ------------------------------------------------------------------------

head( res$layout )


## ------------------------------------------------------------------------

dat.gg <- circleLayoutVertices(res$layout, sizetype = "radius")

head(dat.gg)


## ---- fig.width=7, fig.height=4------------------------------------------
library(ggplot2)

t <- theme_bw() +
  theme(panel.grid = element_blank(),
        axis.text=element_blank(),
        axis.ticks=element_blank(),
        axis.title=element_blank())

theme_set(t)

ggplot(data = dat.gg, aes(x, y, group = id)) +
  geom_polygon(colour="brown", fill="burlywood", alpha=0.3) +
  coord_equal(xlim=limits, ylim=limits)


## ------------------------------------------------------------------------

dat.init <- data.frame(
  x = runif(ncircles, limits[1], limits[2]),
  y = runif(ncircles, limits[1], limits[2]) / 4.0,
  area = areas
)

res <- circleRepelLayout(dat.init, xlim = limits, ylim = limits, 
                         xysizecols = 1:3)

cat(res$niter, "iterations performed")


## ---- fig.width=7, fig.height=4------------------------------------------

# Get vertex data for the initial layout where sizes are areas
dat.gg.initial <- circleLayoutVertices(dat.init, sizetype = "area")

# Get vertex data for the layout returned by the function where
# sizes are radii
dat.gg.final <- circleLayoutVertices(res$layout)

dat.gg <- rbind(
  cbind(dat.gg.initial, set=1),
  cbind(dat.gg.final, set=2)
)

ggplot(data = dat.gg, aes(x, y, group = id)) +
  geom_polygon(colour="brown", fill="burlywood", alpha=0.3) +
  
  coord_equal(xlim=limits, ylim=limits) +
  
  facet_wrap(~ set,
             labeller = as_labeller(c(`1` = "Initial layout",
                                      `2` = "Final layout")))


## ---- fig.width=7, fig.height=4------------------------------------------

# choose several arbitrary circles and make them the larger 
# than the others
largest.ids <- sample(1:ncircles, 10)
dat.init$area[largest.ids] <- 2 * maxarea

# re-generate the vertex data for the initial circles, adding a column
# to indicate if a circle is fixed (the largest) or free
dat.gg.initial <- circleLayoutVertices(dat.init, sizetype = "area")

dat.gg.initial$state <- ifelse(dat.gg.initial$id %in% largest.ids, "fixed", "free")

# now re-run the layout algorithm with a weights vector to fix the position
# of the largest circle
wts <- rep(1.0, nrow(dat.init))
wts[ largest.ids ] <- 0.0

res <- circleRepelLayout(dat.init, xlim = limits, ylim = limits, weights=wts)

dat.gg.final <- circleLayoutVertices(res$layout)
dat.gg.final$state <- ifelse(dat.gg.final$id %in% largest.ids, "fixed", "free")

dat.gg <- rbind(
  cbind(dat.gg.initial, set = 1),
  cbind(dat.gg.final, set = 2)
)

ggplot(data = dat.gg, aes(x, y, group=id, fill=state)) + 
  
  geom_polygon(colour="brown1", show.legend = FALSE) +
  
  scale_fill_manual(breaks = c("fixed", "free"), values=c("brown4", NA)) +
  
  coord_equal(xlim=limits, ylim=limits) +
  
  facet_wrap(~ set,
             labeller = as_labeller(c(`1` = "Initial layout",
                                      `2` = "Final layout")))


