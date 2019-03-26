library(IMak)


### Name: plot_fa
### Title: Plot figural analogies.
### Aliases: plot_fa

### ** Examples

## Create two isomorphs with one rule, setting the correct answer to 1:
one <- build_fa(isomorphs = 2, dot.mov = c(1, 2), correct = 1)
## Plot them:
plot_fa(one)
## Change the correct answer of item 2 from position 1 to position 2:
one <- plot_fa(one, which = 2, switch.from = 1, switch.to = 2)
## Choose a directory and save the items:
# dir1 <- "enter your new directory here"
# plot_fa(one, directory = dir1)

## Create four isomorphs with two rules:
two <- build_fa(isomorphs = 4, mirror = 1, trap.rot = c(90, 45))
## Plot them in German language:
plot_fa(two, language = "D")
## Plot only items 2 and 3 in Spanish and choose form "B" for the internal main shape:
plot_fa(two, language = "S", form.int = "B", which = c(2, 3))
## Choose a different directory and save these two items by keeping the latter configuration:
# dir2 <- "enter your new directory here"
# plot_fa(two, which = c(2, 3), language.dir = "S", form.int = "B", directory = dir2)

## Create 20 isomorphs with three rules. Set automatic = F and affect the options:
three <- build_fa(isomorphs = 20, mirror = 1, trap.rot = c(90, 45), dot.mov = c(1, 2),
automatic = FALSE, al.mirror = c(0, 1), al.trap.rot = -45, al.dot.mov = 1)
## Plot them:
plot_fa(three)
## Plot each individual shape of item 13 in German language only:
plot_fa(three, which = 13, mode = "C", language = "D")
## Choose a different directory and save the item parts:
# dir3 <- "enter your new directory here"
# plot_fa(three, which = 13, mode = "C", language.dir = "D", directory = dir3)



