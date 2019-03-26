library(testDriveR)


### Name: kerrich
### Title: Kerrich Coin Toss Trial Outcomes
### Aliases: kerrich
### Keywords: datasets

### ** Examples

str(kerrich)

if (require("ggplot2")) {
    ggplot(data = kerrich) +
        geom_hline(mapping = aes(yintercept = .5, color = "p(heads)")) +
        geom_line(mapping = aes(x = id, y = average)) +
        ylim(0,1)
}




