## ----style, echo=FALSE, results="asis", message=FALSE--------------------
knitr::opts_chunk$set(tidy = FALSE,
		   message = FALSE)

## ----echo=FALSE, results="hide", message=FALSE---------------------------
library("scatterpie")
theme_set(theme_minimal())

## ------------------------------------------------------------------------
set.seed(123)
long <- rnorm(50, sd=100)
lat <- rnorm(50, sd=50)
d <- data.frame(long=long, lat=lat)
d <- with(d, d[abs(long) < 150 & abs(lat) < 70,])
n <- nrow(d)
d$region <- factor(1:n)
d$A <- abs(rnorm(n, sd=1))
d$B <- abs(rnorm(n, sd=2))
d$C <- abs(rnorm(n, sd=3))
d$D <- abs(rnorm(n, sd=4))
d[1, 4:7] <- d[1, 4:7] * 3
head(d)

## ----fig.width=10--------------------------------------------------------
ggplot() + geom_scatterpie(aes(x=long, y=lat, group=region), data=d,
                           cols=LETTERS[1:4]) + coord_equal()

## ----fig.width=10--------------------------------------------------------
d$radius <- 6 * abs(rnorm(n))
p <- ggplot() + geom_scatterpie(aes(x=long, y=lat, group=region, r=radius), data=d,
                                cols=LETTERS[1:4], color=NA) + coord_equal()
p + geom_scatterpie_legend(d$radius, x=-140, y=-70)

## ----fig.width=10--------------------------------------------------------
world <- map_data('world')
p <- ggplot(world, aes(long, lat)) +
    geom_map(map=world, aes(map_id=region), fill=NA, color="black") +
    coord_quickmap()
p + geom_scatterpie(aes(x=long, y=lat, group=region, r=radius),
                    data=d, cols=LETTERS[1:4], color=NA, alpha=.8) +
    geom_scatterpie_legend(d$radius, x=-160, y=-55)

p + geom_scatterpie(aes(x=long, y=lat, group=region, r=radius),
                    data=d, cols=LETTERS[1:4], color=NA, alpha=.8) +
    geom_scatterpie_legend(d$radius, x=-160, y=-55, n=3, labeller=function(x) 1000*x^2)

## ----echo=FALSE----------------------------------------------------------
sessionInfo()

