library(DAAG)


### Name: panelplot
### Title: Panel Plot
### Aliases: panelplot
### Keywords: models

### ** Examples

       x1 <- x2 <- x3 <- (11:30)/5
          y1 <- x1 + rnorm(20)/2
          y2 <- 2 - 0.05 * x1 + 0.1 * ((x1 - 1.75))^4 + 1.25 * rnorm(20)
          r <- round(cor(x1, y2), 3)
          rho <- round(cor(rank(x1), rank(y2)), 3)
          y3 <- (x1 - 3.85)^2 + 0.015 + rnorm(20)/4
          theta <- ((2 * pi) * (1:20))/20
          x4 <- 10 + 4 * cos(theta)
          y4 <- 10 + 4 * sin(theta) + (0.5 * rnorm(20))
          r1 <- cor(x1, y1)
          xy <- data.frame(x = c(rep(x1, 3), x4), y = c(y1, y2, y3, y4),
                           gp = rep(1:4, rep(20, 4)))
          xy <- split(xy,xy$gp)
          xlimdf <- lapply(list(x1,x2,x3,x4), range)
          ylimdf <- lapply(list(y1,y2,y3,y4), range)
          xy <- lapply(1:4, function(i,u,v,w){list(xlim=v[[i]],ylim=w[[i]],
                             x=u[[i]]$x, y=u[[i]]$y)},
                                u=xy, v=xlimdf, w=ylimdf)

          panel.corr <- function (data, ...)
              {
              x <- data$x
              y <- data$y
              points(x, y, pch = 16)
              chh <- par()$cxy[2]
              x1 <- min(x)
              y1 <- max(y) - chh/4
              r1 <- cor(x, y)
              text(x1, y1, paste(round(r1, 3)), cex = 0.8, adj = 0)
          }


          panelplot(xy, panel=panel.corr, totrows=2, totcols=2,oma=rep(1,4))



