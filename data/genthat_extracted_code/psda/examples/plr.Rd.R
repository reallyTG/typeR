library(psda)


### Name: plr
### Title: Polygonal linear regression
### Aliases: plr

### ** Examples

require(psda)
yp <- psim(10, 4)
xp1 <- psim(10, 4)
xp2 <- psim(10, 4)
e <- new.env()
e$yp <- yp
e$xp1 <- xp1
e$xp2 <- xp2
fit <- plr(yp~xp1+xp2, env = e)



