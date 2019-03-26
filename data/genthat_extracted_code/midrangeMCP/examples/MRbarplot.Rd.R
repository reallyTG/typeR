library(midrangeMCP)


### Name: MRbarplot
### Title: Plotting the result of the multiple comparison procedures
### Aliases: MRbarplot

### ** Examples

# Simulated data (completely randomized design)

rv <- c(100.08, 105.66, 97.64, 100.11, 102.60, 121.29, 100.80,
        99.11, 104.43, 122.18, 119.49, 124.37, 123.19, 134.16,
        125.67, 128.88, 148.07, 134.27, 151.53, 127.31)

# Treatments
treat <- factor(rep(LETTERS[1:5], each = 4))

# Anova
res     <- aov(rv~treat)

# Loading the midrangeMCP package
library(midrangeMCP)

# Choosing tests
results <- MRtest(y = res, trt = "treat", alpha = 0.05,
                   main = "Multiple Comparison Procedures",
                   MCP = c("SKM", "TM"))

MRbarplot(results, MCP = "all") # It will be shown two
                             # graphs. First, for the
                             # results of \code{'SKM'}
                             # and the second for the
                             # results of \code{'TM'}.

MRbarplot(results, MCP = "SKM") # It will be shown
                                 # only the graph
                                 # for the result of
                                 # \code{'SKM'}

# Plot for papers
MRbarplot(results, MCP = "all", col = gray.colors(10))



