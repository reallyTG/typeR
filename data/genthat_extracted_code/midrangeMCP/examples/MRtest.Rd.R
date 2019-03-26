library(midrangeMCP)


### Name: MRtest
### Title: Multiple comparison procedures to the means of a factor using
###   the studentized range and midrange distributions.
### Aliases: MRtest

### ** Examples

# Simulated data (completely randomized design)

# Response variable
rv <- c(100.08, 105.66, 97.64, 100.11, 102.60, 121.29, 100.80,
        99.11, 104.43, 122.18, 119.49, 124.37, 123.19, 134.16,
        125.67, 128.88, 148.07, 134.27, 151.53, 127.31)

# Treatments
treat <- factor(rep(LETTERS[1:5], each = 4))

# Anova
res     <- anova(aov(rv~treat))
DFerror <- res$Df[2]
MSerror <- res$`Mean Sq`[2]

# Loading the midrangeMCP package
library(midrangeMCP)

# applying the tests
results <- MRtest(y = rv,
                  trt = treat,
                  dferror = DFerror,
                  mserror = MSerror,
                  alpha = 0.05,
                  main = "Multiple Comparison Procedure: SKM test",
                  MCP = c("SKM"))

# Other option for the MCP argument is "all". All tests are used.

results$Groups     # Results of the tests
results$Statistics # Main arguments of the tests
results$Summary    # Summary of the response variable

# Using the y argument as aov or lm model
res  <- aov(rv~treat)

MRtest(y = res, trt = "treat", alpha = 0.05,
       main = "Multiple Comparison Procedure: SKM test",
       MCP = c("SKM"))

# For unbalanced data: It will be used the harmonic mean of
#                       the number of experiment replicates

# Using the previous example
rv <- rv[-1]
treat <- treat[-1]

res  <- lm(rv~treat) # Linear model

# Multiple comparison procedure: SKR test
MRtest(y = res, trt = "treat", alpha = 0.05,
       main = "Multiple Comparison Procedure: SKR test",
       MCP = c("SKR"))

# Assuming that the available data are the averages
#  of the treatments and the analysis of variance

# Analysis of Variance Table

# Response: rv
#            Df Sum Sq Mean Sq F value    Pr(>F)
# treat      4 4135.2 1033.80  14.669 4.562e-05 ***
# Residuals 15 1057.1   70.47

mean.treat <- c(100.87, 105.95, 117.62, 127.97, 140.30)
treat <- factor(LETTERS[1:5])
DFerror <- 15
MSerror <- 70.47488
replic <- 4

MRtest(y = mean.treat,
       trt = treat,
       dferror = DFerror,
       mserror = MSerror,
       replication = replic,
       alpha = 0.05,
       main = "Multiple Comparison Procedure: SKM test",
       MCP = c("SKM"),
       ismean = TRUE)




