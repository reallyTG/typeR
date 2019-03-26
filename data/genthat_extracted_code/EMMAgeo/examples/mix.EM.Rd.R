library(EMMAgeo)


### Name: mix.EM
### Title: Function to mix sample spectres.
### Aliases: mix.EM
### Keywords: EMMA

### ** Examples

## define end-member loadings and phi vector
EMa.1 <- create.EM(p1 = c(2, 8), p2 = c(1, 0.8), s = c(0.7, 0.3),
                   boundaries = c(0, 11), n = 80)
EMa.2 <- create.EM(p1 = c(4, 7), p2 = c(1.1, 1.4), s = c(0.5, 0.5),
                   boundaries = c(0, 11), n = 80)
EMa   <- rbind(EMa.1, EMa.2)

phi   <- seq(0, 11, length.out = 80)

## mix end-member loadings
sample1 <- mix.EM(EMa, proportion = c(0.3, 0.7))
sample2 <- mix.EM(EMa, proportion = c(0.5, 0.5), noise = 0.1,
                  autocorrelation = 3)

## plot end-member loadings (grey) and resulting samples (black)
plot(phi, EMa.1, type="l", col = "grey")
lines(phi, EMa.2, col = "grey")
lines(phi, sample1)
lines(phi, sample2)



