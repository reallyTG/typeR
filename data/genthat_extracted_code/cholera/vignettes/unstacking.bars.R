## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library("cholera")
library("HistData")
library("ggplot2")
library("KernSmooth")

bandwidth <- 0.5

top <- c(1:12, 14)
right <- c(37, 62, 74, 142, 147, 205, 240, 248, 280, 360, 405, 419, 465)
bottom <- c(483, seq(487, 495, 2), 498, 500, seq(503, 519, 2))
left <- c(31, 79, 114, 285, 348, 397, 469)
border <- sort(c(bottom, left, top, right))

map.border <- Snow.streets[Snow.streets$street %in% border == TRUE, ]
border.list <- split(map.border[, c("x", "y")], map.border$street)

## Roads ##

roads.list <- split(roads[, c("x", "y")], roads$street)

road.segments <- lapply(unique(roads$street), function(i) {
  dat <- roads[roads$street == i, ]
  names(dat)[names(dat) %in% c("x", "y")] <- c("x1", "y1")
  seg.data <- dat[-1, c("x1", "y1")]
  names(seg.data) <- c("x2", "y2")
  dat <- cbind(dat[-nrow(dat), ], seg.data)
  dat$id <- paste0(dat$street, "-", seq_len(nrow(dat)))
  dat
})

road.segments <- do.call(rbind, road.segments)


## ---- fig.width = 5, fig.height = 5, fig.align = "center", echo = FALSE----
roads.list <- split(roads[, c("x", "y")], roads$street)
plot(fatalities[, c("x", "y")], xlim = range(roads$x), ylim = range(roads$y),
  pch = 15, cex = 0.5, col = "gray", asp = 1)
invisible(lapply(roads.list, lines, col = "gray"))
points(HistData::Snow.pumps[, c("x", "y")], pch = 17, cex = 1, col = "blue")


## ------------------------------------------------------------------------
## The 18 cases at 38 Broad Street ##

broad38 <- c(239, 12, 310, 398, 562, 397, 421, 190, 290, 61, 174, 547, 523,
             521, 138, 59, 340, 508)

fatalities[fatalities$case %in% broad38, ]

## ------------------------------------------------------------------------
fatalities.unstacked[fatalities.unstacked$case %in% broad38, ]

## ------------------------------------------------------------------------
fatalities.address[136:140, ]

## ---- fig.width = 5, fig.height = 5, fig.align = "center", echo = FALSE----

roads.list <- split(roads[, c("x", "y")], roads$street)

## Graph parameters ##
bw <- 1:4
facets <- paste("Bandwidth =", bw)
x.range <- c(11.5, 13.5)
y.range <- c(10.5, 12.5)

## Data ##

Snow.deathsB <- lapply(rep("fatalities", max(bw)), get)
Snow.pumpsB <- lapply(rep("Snow.pumps", max(bw)), get)

for (i in seq_along(Snow.deathsB)) {
  Snow.deathsB[[i]]$facet <- facets[i]
}

Snow.deathsB2 <- Snow.deathsB
Snow.deathsB <- do.call(rbind, Snow.deathsB)

# Cambridge Street #
street.name <- "Cambridge Street"
cambridge.data <- roads[roads$name == street.name, ]
cambridge.data <- cambridge.data[order(cambridge.data$x), ]
d1 <- cambridge.data[-nrow(cambridge.data), c("x", "y")]
d2 <- cambridge.data[-1, c("x", "y")]

intercept.slope <-lapply(seq_len(nrow(cambridge.data) - 1), function(i) {
  coef(lm(y ~ x, data = rbind(d1[i, ], d2[i, ])))
})

sel <- 3
cambridge.angle <- atan(intercept.slope[[sel]][2]) * 180L / pi
cambridge.x <- mean(cambridge.data[sel:(sel + 1), "x"])
cambridge.y <- intercept.slope[[sel]][1] +
  intercept.slope[[sel]][2] * cambridge.x
cambridge.df <- data.frame(x = cambridge.x, y = cambridge.y)

# Broad Street #
street.name <- "Broad Street"
broad.data <- roads[roads$name == street.name, ]
broad.list <- roads.list[paste(unique(broad.data$street))]
broad.list <- lapply(broad.list, function(df) {
  df[order(df$x, decreasing = TRUE), ]
})

broad.pts.data <- do.call(rbind, broad.list)
broad.pts.data <- broad.pts.data[seq_len(nrow(broad.pts.data)) %% 2 != 0, ]

segment.ols <- lapply(broad.list, function(x) {
  coef(lm(y ~ x, data = x))
})

sel <- "193"
seg.id <- do.call(rbind, strsplit(rownames(broad.pts.data), "[.]"))[, 1]
i <- which(seg.id == sel)

broad.angle <- atan(segment.ols[[sel]]["x"]) * 180 / pi
broad.x <- median(broad.pts.data[i:(i + 1), "x"])
broad.y <- segment.ols[[sel]][1] + segment.ols[[sel]][2] * broad.x
broad.df <- data.frame(x = broad.x, y = broad.y)

## Graph ##

p <- ggplot(data = Snow.deathsB, aes(x = x, y = y)) +
  geom_point(color = "gray") +
  geom_point(data = pumps.vestry, aes(x = x, y = y), color = "blue", pch = 2,
             size = 2.5, stroke = 0.75) +
  geom_point(data = pumps, aes(x = x, y = y), color = "#009E73", pch = 2,
          size = 2.5, stroke = 0.75) +
  coord_fixed(xlim = x.range, ylim = y.range) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~ facet, nrow = 2) +
  ggtitle('"Stacked" Fatalities')

for (i in seq_along(roads.list)) {
  p <- p + geom_path(data = roads.list[[i]], aes(x = x, y = y),
    color = "lightgray")
}

for (i in seq_along(bw)) {
  p <- p + geom_density_2d(data = Snow.deathsB2[[i]], aes(x = x, y = y),
    color = "red", size = 1/3, h = bw[i])
}

p + geom_text(data = broad.df, aes(x = x, y = y), label = "Broad St",
              angle = broad.angle) +
  geom_text(data = cambridge.df, aes(x = x, y = y), label = "Cambridge St",
            angle = cambridge.angle)


## ---- fig.width = 5, fig.height = 5, fig.align = "center", echo = FALSE----

## Data ##

fatalities.addressB <- lapply(rep("fatalities.address", max(bw)), get)
fatalities.unstackedB <- lapply(rep("fatalities.unstacked", max(bw)), get)

for (i in seq_along(fatalities.addressB)) {
  fatalities.addressB[[i]]$facet <- facets[i]
}

for (i in seq_along(fatalities.unstackedB)) {
  fatalities.unstackedB[[i]]$facet <- facets[i]
}

fatalities.addressB <- do.call(rbind, fatalities.addressB)

## Graph ##

p <- ggplot(data = fatalities.addressB, aes(x = x, y = y)) +
  geom_point(color = "gray") +
  geom_point(data = pumps.vestry, aes(x = x, y = y), color = "blue", pch = 2,
             size = 2.5, stroke = 0.75) +
  geom_point(data = pumps, aes(x = x, y = y), color = "#009E73", pch = 2,
           size = 2.5, stroke = 0.75) +
  coord_fixed(xlim = x.range, ylim = y.range) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        plot.title = element_text(hjust = 0.5)) +
  facet_wrap(~ facet, nrow = 2) +
  ggtitle('"Unstacked" Fatalities')

for (i in seq_along(roads.list)) {
  p <- p + geom_path(data = roads.list[[i]], aes(x = x, y = y),
    color = "lightgray")
}

for (i in seq_along(bw)) {
  p <- p + geom_density_2d(data = fatalities.unstackedB[[i]], aes(x = x, y = y),
    color = "red", size = 1/3, h = bw[i])
}

p + geom_text(data = broad.df, aes(x = x, y = y), label = "Broad St",
              angle = broad.angle) +
  geom_text(data = cambridge.df, aes(x = x, y = y), label = "Cambridge St",
            angle = cambridge.angle)


