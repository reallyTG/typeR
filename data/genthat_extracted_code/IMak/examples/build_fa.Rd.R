library(IMak)


### Name: build_fa
### Title: Build figural analogies.
### Aliases: build_fa

### ** Examples

## Create two isomorphs with one rule, setting the correct answer to 1:
one <- build_fa(isomorphs = 2, dot.mov = c(1, 2), correct = 1)
## Plot them:
plot_fa(one)

## Create four isomorphs with two rules:
two <- build_fa(isomorphs = 4, main.rot = c(180, 135), trap.rot = c(90, 45))
## Plot them:
plot_fa(two)

## Create 20 isomorphs with three rules. Set automatic = F and affect the options:
three <- build_fa(isomorphs = 20, mirror = 1, trap.rot = c(90, 45), dot.mov = c(1, 2),
automatic = FALSE, al.mirror = c(0, 1), al.trap.rot = -45, al.dot.mov = 1)
## Plot them:
plot_fa(three)

## Create and plot four two-rule-based isomorphs, all of them comprising the same Figure A:
four <- build_fa(isomorphs = 4, a.main = 1, a.flip = FALSE, a.trap = 2, a.dot = 6,
mirror = 1, subtract = "R")
plot_fa(four)

## Create and plot 16 isomorphs by constricting the main shape rotation rule:
five <- build_fa(isomorphs = 16, subtract = c(1, 4), constrict = "main")
plot_fa(five)



