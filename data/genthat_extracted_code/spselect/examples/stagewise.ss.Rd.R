library(spselect)


### Name: stagewise.ss
### Title: Spatial scale incremental forward stagewise regression
### Aliases: stagewise.ss
### Keywords: models

### ** Examples

data(y)
data(X)
data(X.3D)
ss <- c("ind", "ss1", "ss2")
mod_forward.stage.ss_0.1 <- stagewise.ss(y, X ,X.3D, ss, 0.1, 0.1, c("black", "red", "green"))



