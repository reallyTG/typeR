library(equate)


### Name: plot.bootstrap
### Title: Plotting Bootstrap Equating Results
### Aliases: plot.bootstrap
### Keywords: misc

### ** Examples


set.seed(122713)
neat.x <- freqtab(KBneat$x, scales = list(0:36, 0:12))
neat.y <- freqtab(KBneat$y, scales = list(0:36, 0:12))
eqargs <- list(m.t = list(type = "mean", method = "t"),
  l.t = list(type = "lin", method = "t"),
	c.t = list(type = "circ", method = "t"))
bootout <- bootstrap(x = neat.x, y = neat.y, args = eqargs,
	reps = 20)
plot(bootout, out = "se", legendplace = "top")




