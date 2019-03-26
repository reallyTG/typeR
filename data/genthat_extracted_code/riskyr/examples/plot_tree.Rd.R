library(riskyr)


### Name: plot_tree
### Title: Plot a tree diagram of frequencies and probabilities.
### Aliases: plot_tree

### ** Examples

# Plotting existing freq:
plot_tree()
plot_tree(by = "dc")
plot_tree(area = "sq")
plot_tree(p.lbl = "num")
plot_tree(title.lbl = "")
plot_tree(N = 33)
plot_tree(N = NA)

# Computing and plotting new frequencies:
plot_tree(prev = 1/3)
plot_tree(prev = 1/3, N = 55)
plot_tree(prev = 1/3, N = NA)
plot_tree(prev = 1/3, round = FALSE)
plot_tree(prev = .10, sens = .90, spec = 1/3, N = 100)
plot_tree(prev = .10, sens = .90, spec = NA, fart = 1/3, N = 33)
plot_tree(prev = .10, sens = .90, spec = 1/3, fart = NA, N = NA)
plot_tree(prev = .10, sens = .90, spec = NA, fart = 1/3, N = NA)

# Area options:
plot_tree(area = "sq")
plot_tree(area = "sq", round = FALSE)
plot_tree(area = "hr")
plot_tree(area = "vr", round = FALSE)

# Accuracy:
plot_tree(show.accu = TRUE)               # => default w = .5 (balanced accuracy "bacc")
plot_tree(show.accu = TRUE, w.acc = 1/3)  # => (weighted accuracy "wacc")
plot_tree(show.accu = FALSE)              # => no accuracy info.

# Perspectives, areas, and label options:
plot_tree(by = "cd", area = "sq", p.lbl = "nam")  # => by cond + sq + prob names
plot_tree(by = "cd", area = "hr", p.lbl = "num")  # => by cond + hr + prob numbers
plot_tree(by = "dc", area = "sq", p.lbl = "num")  # => by dec  + sq + names and numbers
plot_tree(by = "dc", area = "vr", p.lbl = "mix")  # => by dec  + vr + min. labels

# Custom colors and shadows:
plot_tree(prev = .08, sens = .92, spec = .95, N = 10000, area = "hr")
plot_tree(area = "sq", col.boxes = "gold", col.border = "steelblue4",
          col.shadow = "steelblue4", cex.shadow = .008)
plot_tree(N = NA, area = "vr", col.txt = "steelblue4", col.boxes = "lightyellow",
          col.border = grey(.3, .7), cex.shadow = .008, col.shadow = grey(.1, .9))




