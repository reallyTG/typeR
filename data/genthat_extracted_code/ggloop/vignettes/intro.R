## ----xy-pairs, message=FALSE---------------------------------------------
library(ggplot2)
library(ggloop)
g <- ggloop(mtcars, aes_loop(x = mpg:hp, y = mpg:hp))

## ----simple-1------------------------------------------------------------
g$x.mpg_y.hp %L+% geom_point()
g$x.cyl_y.disp %L+% geom_point()
g$x.disp_y.hp %L+% geom_point() %L+% geom_line()

## ----simple-2------------------------------------------------------------
g[1:2] <- g[1:2] %L+% geom_point()
g[1:2]

## ----simple-3------------------------------------------------------------
lapply(g, `[[`, "mapping")

## ----facet-1-------------------------------------------------------------
g2 <- ggloop(mtcars, aes_loop(x = c(mpg, disp, hp), y = wt, color = factor(cyl))) %L+%
  geom_point() %L+%
  facet_grid(. ~ cyl)

## ----facet-2-------------------------------------------------------------
g2$`color.factor(cyl)`[1:3]

## ----facet-3-------------------------------------------------------------
lapply(g2, function(x) lapply(x, `[[`, "mapping"))

## ----aes.list-1----------------------------------------------------------
g3 <- ggloop(mtcars,
             aes_loop(x = c(mpg, disp, hp), y = wt, color = c(factor(cyl), factor(gear))), 
             gg_obs = FALSE)
print(g3)

