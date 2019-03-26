library(rpact)


### Name: getDesignSet
### Title: Get Design Set
### Aliases: getDesignSet

### ** Examples


# Example 1
 design <- getDesignGroupSequential(alpha = 0.05, kMax = 6, 
    sided = 2, typeOfDesign = "WT", deltaWT = 0.1)
 designSet <- getDesignSet()
 designSet$add(design = design, deltaWT = c(0.3, 0.4))
 if (require(ggplot2)) plot(designSet, type = 1)

# Example 2 (shorter script)
design <- getDesignGroupSequential(alpha = 0.05, kMax = 6, 
    sided = 2, typeOfDesign = "WT", deltaWT = 0.1)
designSet <- getDesignSet(design = design, deltaWT = c(0.3, 0.4))
if (require(ggplot2)) plot(designSet)




