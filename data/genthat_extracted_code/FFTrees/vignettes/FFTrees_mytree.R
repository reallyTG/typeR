## ---- echo = FALSE-------------------------------------------------------
options(digits = 3)
knitr::opts_chunk$set(echo = TRUE, fig.width = 7.5, fig.height = 7.5, dpi = 100, out.width = "600px", fig.align='center', message = FALSE)

## ---- echo = F, message = F, results = 'hide'----------------------------
library(FFTrees)

## ------------------------------------------------------------------------
head(heartdisease[c("sex", "age", "thal")])

## ---- eval = FALSE-------------------------------------------------------
#  my.tree = "If sex = 1, predict True.
#             If age < 45, predict False.
#             If thal = {fd, normal}, predict True. Otherwise, predict False"

## ------------------------------------------------------------------------
# Pass a verbally defined FFT to FFTrees with the my.tree argument
my.heart.fft <- FFTrees(diagnosis ~.,
                        data = heartdisease,
                        my.tree = "If sex = 1, predict True.
                                   If age < 45, predict False. 
                                   If thal = {fd, normal}, predict True. 
                                   Otherwise, predict False")

## ------------------------------------------------------------------------
# Plot 
plot(my.heart.fft)

## ------------------------------------------------------------------------
# Specify an FFt verbally with the my.tree argument
my.heart.fft <- FFTrees(diagnosis ~.,
                        data = heartdisease,
                        my.tree = "If thal = {rd,fd}, predict True.
                                   If cp != {a}, predict False. 
                                   If ca > 1, predict True. 
                                   Otherwise, predict False")

# Plot 
plot(my.heart.fft)

## ------------------------------------------------------------------------
head(titanic[c("class", "age", "sex", "survived")])

## ------------------------------------------------------------------------
my.titanic.tree <- "If age = {child}, predict True.
                   If sex = {female}, predict True.
                   If class = {first}, predict True.
                   Otherwise, predict False"

titanic.fft <- FFTrees(survived ~., 
                      data = titanic, 
                      my.tree = my.titanic.tree,
                      comp = FALSE)

plot(titanic.fft)

## ---- echo = FALSE-------------------------------------------------------
heart.fft <- FFTrees(diagnosis ~., 
                     data = heartdisease)

## ---- echo = FALSE-------------------------------------------------------
heart.fft$tree.definitions

## ------------------------------------------------------------------------
# Create an FFTrees object
heart.fft <- FFTrees(diagnosis ~., 
                              data = heartdisease)

# Get the tree definitions
heart.tree.definitions <- heart.fft$tree.definitions

# Print the result
heart.tree.definitions

## ------------------------------------------------------------------------
# Define two trees
my.tree.definitions <- data.frame(tree = c(1, 2),
                                  nodes = c(2, 3),
                                  classes = c("c;n", "n;n;f"),
                                  cues = c("slope;ca", "chol;oldpeak;restecg"),
                                  directions = c("=;>", "<;>;!="),
                                  thresholds = c("down,up;1", "300;2;normal"),
                                  exits = c("0;.5", "1;1;.5"), 
                                  stringsAsFactors = FALSE)

## ------------------------------------------------------------------------
#Pass trees to FFTrees with tree.definitions
my.heart.fft <- FFTrees(diagnosis ~ .,
                        data = heartdisease,
                        tree.definitions = my.tree.definitions)

# Show summary statistics
my.heart.fft

# Plot Tree 2
plot(my.heart.fft, tree = 2)


## ------------------------------------------------------------------------
# Plot Tree 1
plot(my.heart.fft, tree = 1)

## ------------------------------------------------------------------------
# Plot Tree 2
plot(my.heart.fft, tree = 2)

