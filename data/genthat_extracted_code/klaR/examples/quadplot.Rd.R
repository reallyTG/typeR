library(klaR)


### Name: quadplot
### Title: Plotting of 4 dimensional membership representation simplex
### Aliases: quadplot
### Keywords: classif dplot

### ** Examples

library("MASS")
data(B3)
opar <- par(mfrow = c(1, 2), pty = "s")
posterior <- predict(lda(PHASEN ~ ., data = B3))$post
s3d <- quadplot(posterior, col = rainbow(4)[B3$PHASEN], 
        labelpch = 22:25, labelcex = 0.8,
        pch = (22:25)[apply(posterior, 1, which.max)], 
        main = "LDA posterior assignments")
quadlines(centerlines(4), sp = s3d, lty = "dashed")

posterior <- predict(qda(PHASEN ~ ., data = B3))$post
s3d <- quadplot(posterior, col = rainbow(4)[B3$PHASEN], 
        labelpch = 22:25, labelcex = 0.8,
        pch = (22:25)[apply(posterior, 1, which.max)],
        main = "QDA posterior assignments")
quadlines(centerlines(4), sp = s3d, lty = "dashed")
par(opar)



