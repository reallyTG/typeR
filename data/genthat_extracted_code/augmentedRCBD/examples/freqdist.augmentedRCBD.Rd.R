library(augmentedRCBD)


### Name: freqdist.augmentedRCBD
### Title: Plot Frequency Distribution from 'augmentedRCBD' Output
### Aliases: freqdist.augmentedRCBD

### ** Examples

# Example data
blk <- c(rep(1,7),rep(2,6),rep(3,7))
trt <- c(1, 2, 3, 4, 7, 11, 12, 1, 2, 3, 4, 5, 9, 1, 2, 3, 4, 8, 6, 10)
y1 <- c(92, 79, 87, 81, 96, 89, 82, 79, 81, 81, 91, 79, 78, 83, 77, 78, 78,
        70, 75, 74)
y2 <- c(258, 224, 238, 278, 347, 300, 289, 260, 220, 237, 227, 281, 311, 250,
        240, 268, 287, 226, 395, 450)
data <- data.frame(blk, trt, y1, y2)
# Convert block and treatment to factors
data$blk <- as.factor(data$blk)
data$trt <- as.factor(data$trt)
# Results for variable y1
out1 <- augmentedRCBD(data$blk, data$trt, data$y1, method.comp = "lsd",
                      alpha = 0.05, group = TRUE, console = TRUE)
# Results for variable y2
out2 <- augmentedRCBD(data$blk, data$trt, data$y2, method.comp = "lsd",
                     alpha = 0.05, group = TRUE, console = TRUE)

# Frequency distribution plots
freq1 <- freqdist.augmentedRCBD(out1, xlab = "Trait 1")
class(freq1)
plot(freq1)
freq2 <- freqdist.augmentedRCBD(out2, xlab = "Trait 2")
plot(freq2)

# Change check colours
colset <- c("red3", "green4", "purple3", "darkorange3")
freq1 <- freqdist.augmentedRCBD(out1, xlab = "Trait 1", check.col = colset)
plot(freq1)
freq2 <- freqdist.augmentedRCBD(out2, xlab = "Trait 2", check.col = colset)
plot(freq2)

# Without checks highlighted
freq1 <- freqdist.augmentedRCBD(out1, xlab = "Trait 1",
                                highlight.check = FALSE)
plot(freq1)
freq2 <- freqdist.augmentedRCBD(out2, xlab = "Trait 2",
                                highlight.check = FALSE)
plot(freq2)



