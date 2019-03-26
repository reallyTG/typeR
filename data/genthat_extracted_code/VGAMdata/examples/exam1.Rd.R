library(VGAMdata)


### Name: exam1
### Title: Examination data
### Aliases: exam1
### Keywords: datasets

### ** Examples

summary(exam1)  # The names of the students are the row names

# Fit a simple Rasch model.
# First, remove all questions and people who were totally correct or wrong
exam1.1 <- exam1  [, colMeans(exam1  ) > 0]
exam1.1 <- exam1.1[, colMeans(exam1.1) < 1]
exam1.1 <- exam1.1[rowMeans(exam1.1) > 0, ]
exam1.1 <- exam1.1[rowMeans(exam1.1) < 1, ]
Y.matrix <- rdata <- exam1.1

## Not run: 
##D  # The following needs: library(VGAM)
##D rfit <- rcim(Y.matrix, family = binomialff(multiple.responses = TRUE),
##D              trace = TRUE)
##D 
##D coef(rfit)  # Row and column effects
##D constraints(rfit, matrix = TRUE)  # Constraint matrices side-by-side
##D dim(model.matrix(rfit, type = "vlm"))  # 'Big' VLM matrix
## End(Not run)

## Not run: 
##D  # This plot shows the (main) row and column effects
##D par(mfrow = c(1, 2), las = 1, mar = c(4.5, 4.4, 2, 0.9) + 0.1)
##D saved <- plot(rfit, rcol = "blue", ccol = "orange",
##D               cylab = "Item effects", rylab = "Person effects",
##D               rxlab = "", cxlab = "")
##D 
##D names(saved@post)  # Some useful output put here
##D cbind(saved@post$row.effects)
##D cbind(saved@post$raw.row.effects)
##D round(cbind(-saved@post$col.effects), dig = 3)
##D round(cbind(-saved@post$raw.col.effects), dig = 3)
##D round(matrix(-saved@post$raw.col.effects, ncol = 1,  # Rename for humans
##D              dimnames = list(colnames(Y.matrix), NULL)), dig = 3)
## End(Not run)



