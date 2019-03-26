library(riskyr)


### Name: plot_fnet
### Title: Plot a network diagram of frequencies and probabilities.
### Aliases: plot_fnet

### ** Examples

# Plotting existing freq:
plot_fnet()  # => plot current freq with default options
plot_fnet(by = "dccd")
plot_fnet(area = "no")
plot_fnet(p.lbl = "num")
plot_fnet(title.lbl = "")
plot_fnet(N = 33)
plot_fnet(N = NA)

# Computing and plotting new frequencies from probabilities:
plot_fnet(prev = 1/3)  # => changes prev, but uses current defaults of sens and spec
plot_fnet(prev = 1/3, N = 55)
plot_fnet(prev = 1/3, N = NA)
plot_fnet(prev = 1/3, round = FALSE)
plot_fnet(prev = .10, sens = .90, spec = 1/3, N = 100)
plot_fnet(prev = .10, sens = .90, spec = NA, fart = 1/3, N = 33)
plot_fnet(prev = .10, sens = .90, spec = 1/3, fart = NA, N = NA)
plot_fnet(prev = .10, sens = .90, spec = NA, fart = 1/3, N = NA)

# Perspective options:
plot_fnet(by = "cd")    # => 1. Tree diagram (by condition)
plot_fnet(by = "dc")    # => 2. Tree diagram (by decision)
plot_fnet(by = "cddc")  # => 3. Network diagram (1st by cond, 2nd by dec) (default)
plot_fnet(by = "dccd")  # => 4. Network diagram (1st by dec, 2nd by cond)

# Area options:
plot_fnet(area = "sq")  # => (default)
plot_fnet(area = "no")
plot_fnet(area = "sq", round = FALSE)
plot_fnet(area = "hr")
plot_fnet(area = "vr", round = FALSE)

# Accuracy:
plot_fnet(show.accu = TRUE)               # => default w = .5 (balanced accuracy "bacc")
plot_fnet(show.accu = TRUE, w.acc = 1/3)  # => (weighted accuracy "wacc")
plot_fnet(show.accu = FALSE)              # => no accuracy info.

# Rounding:
plot_fnet(prev = .1, sens = .7, spec = .9, N = 10, by = "cddc", area = "sq",
          p.lbl = "num", round = TRUE)    # => mi = 0
plot_fnet(prev = .1, sens = .7, spec = .9, N = 10, by = "cddc", area = "sq",
          p.lbl = "num", round = FALSE)   # => mi = 0.3

# Combining perspectives, areas, and label options:
plot_fnet(by = "cd", area = "sq", p.lbl = "nam")  # => by cond + sq + prob names
plot_fnet(by = "cd", area = "hr", p.lbl = "num")  # => by cond + hr + prob numbers
plot_fnet(by = "dc", area = "sq", p.lbl = "num")  # => by dec  + sq + mix names and numbers
plot_fnet(by = "dc", area = "vr", p.lbl = "mix")  # => by dec  + vr + min. labels

# Custom colors and shadows:
plot_fnet(prev = .08, sens = .92, spec = .95, N = 10000, area = "hr")
plot_fnet(area = "sq", col.boxes = "gold", col.border = "steelblue4",
          col.shadow = "steelblue4", cex.shadow = .008)
plot_fnet(N = NA, area = "vr", col.txt = "steelblue4", col.boxes = "lightyellow",
          col.border = grey(.3, .7), cex.shadow = .008, col.shadow = grey(.1, .9))





