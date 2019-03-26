library(analytics)


### Name: Wbiplot
### Title: Weighted Biplot
### Aliases: Wbiplot

### ** Examples


require(graphics)

# Exemple 1: Row metric preserving
Wbiplot(USArrests, numer1 = 1, numer2 = 0, cx = 0.6)

# Exemple 2: Column metric preserving
Wbiplot(USArrests, numer1 = 0, numer2 = 1, cx = 0.6)

# Comparison with function \code{biplot} from package \pkg{stats}
biplot(princomp(USArrests), cex = 0.6)

# Example 3: Custom, 50-50
Wbiplot(USArrests, numer1 = 0.5, numer2 = 0.5)

# Example 4: Custom, 20-80
Wbiplot(USArrests, numer1 = 0.2, numer2 = 0.8)




