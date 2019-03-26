library(midrangeMCP)


### Name: MRwrite
### Title: Export the results of the 'MRtest' function.
### Aliases: MRwrite

### ** Examples

# Simulated data (completely randomized design)

rv <- c(100.08, 105.66, 97.64, 100.11, 102.60, 121.29, 100.80,
        99.11, 104.43, 122.18, 119.49, 124.37, 123.19, 134.16,
        125.67, 128.88, 148.07, 134.27, 151.53, 127.31)

# Treatments
treat <- factor(rep(LETTERS[1:5], each = 4))

# Anova
res <- aov(rv~treat)

# Loading the midrangeMCP package
library(midrangeMCP)

# Choosing any tests
results <- MRtest(y = res, trt = "treat", alpha = 0.05,
                   main = "Multiple Comparison Procedures",
                   MCP = c("SKM", "TM"))

#Export file in latex (Output in Console)
MRwrite(results, MCP = "all", extension = "latex", dataMR = "all")

#Export file with extension txt (Output in Directory)
MRwrite(results, MCP = "all", extension = "txt", dataMR = "all")

#Export file with extension csv (Output in Directory)
MRwrite(results, MCP = "all", extension = "csv", dataMR = "all")

#Export file to Microsoft excel (Output in Directory)
MRwrite(results, MCP = "all", extension = "xlsx", dataMR = "all")

#Observation: The MRwrite function export
#             only one extension at a time



