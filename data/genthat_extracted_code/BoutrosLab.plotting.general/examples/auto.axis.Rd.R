library(BoutrosLab.plotting.general)


### Name: auto.axis
### Title: Create ideal labels and values for a given dataset (detects log
###   scales)
### Aliases: auto.axis

### ** Examples

set.seed(223);
simple.data <- data.frame(
    x = sample(1:15, 10),
    y = LETTERS[1:10]
    );

auto.axis(simple.data$x)

data2 <- c(1,10,100,1000)

auto.axis(data2)



