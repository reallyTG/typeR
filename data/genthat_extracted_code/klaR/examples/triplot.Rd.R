library(klaR)


### Name: triplot
### Title: Barycentric plots
### Aliases: triplot
### Keywords: aplot

### ** Examples

# illustrating probabilities: 
triplot(label = c("1, 2 or 3", "4 or 5", "6"), 
    main = "die rolls: probabilities", pch = 17)
triperplines(1/2, 1/3, 1/6)

# expected... 
triplot(1/2, 1/3, 1/6, label = c("1, 2 or 3", "4 or 5", "6"), 
    main = "die rolls: expected and observed frequencies", pch = 17)
# ... and observed frequencies. 
dierolls <- matrix(sample(1:3, size = 50*20, prob = c(1/2, 1/3, 1/6), 
                          replace = TRUE), ncol = 50)
frequencies <- t(apply(dierolls, 1, 
    function(x)(summary(factor(x, levels = 1:3)))) / 50)
tripoints(frequencies)

# LDA classification posterior: 
data(iris)
require(MASS)
pred <- predict(lda(Species ~ ., data = iris),iris)
plotchar <- rep(1,150)
plotchar[pred$class != iris$Species] <- 19
triplot(pred$posterior, label = colnames(pred$posterior), 
        main = "LDA posterior assignments", center = TRUE, 
        pch = plotchar, col = rep(c("blue", "green3", "red"), rep(50, 3)), 
        grid = TRUE)
legend(x = -0.6, y = 0.7, col = c("blue", "green3", "red"), 
    pch = 15, legend = colnames(pred$posterior))



