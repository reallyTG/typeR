library(mise)


### Name: mise
### Title: Clear the Workspace (Mise en Place)
### Aliases: mise
### Keywords: clear detach, graphics.off(), rm,

### ** Examples

library(mise)
x <- seq(1, 10, by = 1)
y <- x+ rnorm(10, mean = 0, sd = 1)
plot(x, y)
ls()
# change figs to TRUE to also clear the figure
mise(figs = FALSE)
ls()



