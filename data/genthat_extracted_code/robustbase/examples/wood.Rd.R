library(robustbase)


### Name: wood
### Title: Modified Data on Wood Specific Gravity
### Aliases: wood
### Keywords: datasets

### ** Examples

data(wood)
plot(wood)
summary( lm.wood <-        lm(y ~ ., data = wood))
summary(rlm.wood <- MASS::rlm(y ~ ., data = wood))
summary(lts.wood <-    ltsReg(y ~ ., data = wood))

wood.x <- as.matrix(wood)[,1:5]
c_wood <- covMcd(wood.x)
c_wood



