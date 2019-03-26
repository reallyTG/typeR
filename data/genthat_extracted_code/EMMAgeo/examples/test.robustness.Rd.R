library(EMMAgeo)


### Name: test.robustness
### Title: Function to test model robustness.
### Aliases: test.robustness
### Keywords: EMMA

### ** Examples

## load example data set
data(X, envir = environment())

## Example 1 - perform the most simple test
q  <- 4:7
l <- seq(from = 0, to = 0.1, by = 0.02)

M1  <- test.robustness(X = X, q = q, l = l,
                       ol.rej = 1, mRt.rej = 0.8,
                       plot = TRUE,
                       colour = c(4, 7),
                       xlab = c(expression(paste("Grain size (", phi, ")",
                                                 sep = "")),
                                expression(paste("Grain size (", phi, ")",
                                                 sep = ""))))

## Example 2 -  perform the test without rejection criteria and plots
P  <- cbind(rep(q[1], length(l)),
            rep(q[3], length(l)),
            l)
M2  <- test.robustness(X = X, P = P)

## Plot 1 - end-member loadings which do not overlap and yielded mRt > 0.80.
plot(M2$Vqsn[1,], type = "l", ylim = c(0, max(M2$Vqsn, na.rm = TRUE)),
     main = "End-member loadings")
  for (i in 2:nrow(M2$Vqsn)) lines(M2$Vqsn[i,])

# Plot 2 - histogram of mode positions
hist(M2$modes,
     breaks = 1:ncol(X),
     main = "Mode positions",
     xlab = "Class")

# Plot 3 - positions of modelled end-member modes by number of end-members
# Note how scatter in end-member position decreases for the "correct" number
# of modelled end-members (6) and an appropriate weight limit (ca. 0.1).
ii <- order(M2$q, M2$modes)
modes <- t(rbind(M2$modes, M2$q))[ii,]
plot(modes[,1],
     seq(1, nrow(modes)),
     main = "Model overview",
     xlab = "Class",
     ylab = "EM number in model run",
     pch = as.character(modes[,2]),
     cex = 0.7)

# Illustrate mode positions as stem-and-leave-plot, useful as a simple
# check, which mode maxima are consistently fall into which grain-size
# class (useful to define "limits" in robust.EM).
stem(M2$modes, scale = 2)



