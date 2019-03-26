library(ungroup)


### Name: pclm
### Title: Univariate Penalized Composite Link Model (PCLM)
### Aliases: pclm

### ** Examples

# Data  
x <- c(0, 1, seq(5, 85, by = 5))
y <- c(294, 66, 32, 44, 170, 284, 287, 293, 361, 600, 998, 
       1572, 2529, 4637, 6161, 7369, 10481, 15293, 39016)
offset <- c(114, 440, 509, 492, 628, 618, 576, 580, 634, 657, 
            631, 584, 573, 619, 530, 384, 303, 245, 249) * 1000
nlast <- 26 # the size of the last interval

# Example 1 ----------------------
M1 <- pclm(x, y, nlast)
ls(M1)
summary(M1)
fitted(M1)
plot(M1)

# Example 2 ----------------------
# ungroup even in smaller intervals
M2 <- pclm(x, y, nlast, out.step = 0.5)
head(fitted(M1))
plot(M1, type = "s")
# Note, in example 1 we are estimating intervals of length 1. In example 2 
# we are estimating intervals of length 0.5 using the same aggregate data.

# Example 3 ----------------------
# Do not optimise smoothing parameters; choose your own. Faster.
M3 <- pclm(x, y, nlast, out.step = 0.5, 
           control = list(lambda = 100, kr = 10, deg = 10))
plot(M3)

summary(M2)
summary(M3) # not the smallest BIC here, but sometimes is not important.

# Example 4 -----------------------
# Grouped x & grouped offset (estimate death rates)
M4 <- pclm(x, y, nlast, offset)
plot(M4, type = "s")

# Example 5 -----------------------
# Grouped x & ungrouped offset (estimate death rates)

ungroupped_Ex <- pclm(x, y = offset, nlast, offset = NULL)$fitted # ungroupped offset data

M5 <- pclm(x, y, nlast, offset = ungroupped_Ex)



