library(xtermStyle)


### Name: xterm.pal
### Title: Get predefined colour palettes
### Aliases: display.xterm.pal xterm.pal xterm.pal.inv

### ** Examples

display.xterm.pal()
pal <- xterm.pal()$Accent

freqs <- runif(6)
fruits <- factor(sample(6, size=30, replace=TRUE, freqs/sum(freqs)),
                 labels=c("apple", "grapes", "banana", "lemon",
                          "blueberry", "raspberry"))
for(i in 1:length(fruits))
    cat(style(fruits[i], "\n", fg=pal[fruits[i]]))



