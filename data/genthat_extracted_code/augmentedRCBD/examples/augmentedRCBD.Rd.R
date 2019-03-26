library(augmentedRCBD)


### Name: augmentedRCBD
### Title: Analysis of Augmented Randomised Complete Block Design
### Aliases: augmentedRCBD

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
# Results for variable y1 (checks inferred)
out1 <- augmentedRCBD(data$blk, data$trt, data$y1, method.comp = "lsd",
                      alpha = 0.05, group = TRUE, console = TRUE)
# Results for variable y2 (checks inferred)
out2 <- augmentedRCBD(data$blk, data$trt, data$y1, method.comp = "lsd",
                     alpha = 0.05, group = TRUE, console = TRUE)

# Results for variable y1 (checks specified)
out1 <- augmentedRCBD(data$blk, data$trt, data$y1, method.comp = "lsd",
                      alpha = 0.05, group = TRUE, console = TRUE,
                      checks = c("1", "2", "3", "4"))
# Results for variable y2 (checks specified)
out2 <- augmentedRCBD(data$blk, data$trt, data$y1, method.comp = "lsd",
                      alpha = 0.05, group = TRUE, console = TRUE,
                      checks = c("1", "2", "3", "4"))

## Not run: 
##D # Error in case checks not replicated across all blocks
##D # Check 1 and 4 not replicated in all 3 blocks
##D trt <- c(1, 2, 3, 14, 7, 11, 12, 1, 2, 3, 4, 5, 9, 13, 2, 3, 4, 8, 6, 10)
##D data$trt <- as.factor(trt)
##D table(data$trt, data$blk)
##D # Results for variable y1 (checks specified)
##D out1 <- augmentedRCBD(data$blk, data$trt, data$y1, method.comp = "lsd",
##D                       alpha = 0.05, group = TRUE, console = TRUE,
##D                       checks = c("1", "2", "3", "4"))
## End(Not run)

# Warning in case test treatments are replicated
out1 <- augmentedRCBD(data$blk, data$trt, data$y1, method.comp = "lsd",
                      alpha = 0.05, group = TRUE, console = TRUE)
out1 <- augmentedRCBD(data$blk, data$trt, data$y1, method.comp = "lsd",
                      alpha = 0.05, group = TRUE, console = TRUE,
                      checks = c("2", "3"))




