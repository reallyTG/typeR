library(LindenmayeR)


### Name: drawLsys
### Title: Draw a 2D L-System Using Turtle Graphics
### Aliases: drawLsys
### Keywords: plot

### ** Examples

require('grid')

# Modified Koch curve
rkoch1 <- data.frame(inp = c("F"), out = c("F+F-F-F+F"), stringsAsFactors = FALSE)
k1 <- Lsys(init = "F", rules = rkoch1, n = 3)
dkoch <- data.frame(symbol = c("F", "f", "+", "-", "[", "]"),
action = c("F", "f", "+", "-", "[", "]"), stringsAsFactors = FALSE)
drawLsys(string = k1, stepSize = 3, st = c(10, 50, 0), drules = dkoch)
grid.text("Modified Koch Curve (n = 3)", 0.5, 0.25)

# Classic Koch snowflake
rkoch2 <- data.frame(inp = c("F"), out = c("F-F++F-F"), stringsAsFactors = FALSE)
k2 <- Lsys(init = "F++F++F", rules = rkoch2, n = 4)
drawLsys(string = k2, stepSize = 1, ang = 60, st = c(10, 25, 0), drules = dkoch)
grid.text("Classic Koch Snowflake (n = 4)", 0.5, 0.5)

# Sierpinski Triangle
rSierp <- data.frame(inp = c("A", "B"), out = c("B-A-B", "A+B+A"), stringsAsFactors = FALSE)
s <- Lsys(init = "A", rules = rSierp, n = 6)
dSierp <- data.frame(symbol = c("A", "B", "+", "-", "[", "]"),
action = c("F", "F", "+", "-", "[", "]"), stringsAsFactors = FALSE)
drawLsys(string = s, stepSize = 1, ang = 60, st = c(20, 25, 0), drules = dSierp)
grid.text("Sierpinski Triangle (n = 6)", 0.5, 0.1)

# Islands & Lakes
islands_rules <- data.frame(inp = c("F", "f"), out = c("F+f-FF+F+FF+Ff+FF-f+FF-F-FF-Ff-FFF",
"ffffff"), stringsAsFactors = FALSE)
islands <- Lsys(init = "F+F+F+F", rules = islands_rules, n = 2)
draw_islands <- data.frame(symbol = c("F", "f", "+", "-", "[", "]"),
action = c("F", "f", "+", "-", "[", "]"), stringsAsFactors = FALSE)
drawLsys(string = islands, step = 1, ang = 90, st = c(70, 35, 90),
drules = draw_islands,  gp = gpar(col = "red", fill = "gray"))

# A primitive tree (aka Pythagoras Tree)
prim_rules <- data.frame(inp = c("0", "1"),
out = c("1[+0]-0", "11"), stringsAsFactors = FALSE)
primitive_plant <- Lsys(init = "0", rules = prim_rules, n = 7)
draw_prim <- data.frame(symbol = c("0", "1", "+", "-", "[", "]"),
action = c("F", "F", "+", "-", "[", "]"), stringsAsFactors = FALSE)
drawLsys(string = primitive_plant, stepSize = 1, ang = 45, st = c(50, 5, 90),
drules = draw_prim, which = 7)
grid.text("Primitive Tree (n = 6)", 0.5, 0.75)

# A more realistic botanical structure
# Some call this a fractal tree, I think it is more like seaweed
# Try drawing the last iteration (too slow for here, but looks great)
fractal_tree_rules <- data.frame(inp = c("X", "F"),
out = c("F-[[X]+X]+F[+FX]-X", "FF"), stringsAsFactors = FALSE)
fractal_tree <- Lsys(init = "X", rules = fractal_tree_rules, n = 7)
draw_ft <- data.frame(symbol = c("X", "F", "+", "-", "[", "]"),
action = c("f", "F", "+", "-", "[", "]"), stringsAsFactors = FALSE)
drawLsys(string = fractal_tree, stepSize = 2, ang = 25, st = c(50, 5, 90),
drules = draw_ft, which = 5, gp = gpar(col = "chocolate4", fill = "honeydew"))
grid.text("Fractal Seaweed (n = 4)", 0.25, 0.25)



