library(IncDTW)


### Name: dtw2vec
### Title: Fast vector-based Dynamic Time Warping
### Aliases: dtw2vec dtw2vec_cm dtw2vec_univ dtw2vec_multiv
### Keywords: classif cluster ts

### ** Examples

Q <- cumsum(rnorm(100))
C <- Q[11:100] + rnorm(90, 0, 0.5)
dtw2vec(Q = Q, C = C)
dtw2vec(Q = Q, C = C, ws = 30)
dtw2vec(Q = Q, C = C, threshold = 100)
dtw2vec(Q = Q, C = C, ws = 30, threshold = 100)

cm0 <- cm(Q, C)
dtw2vec(Q = cm0, C = "cm", ws = 30, threshold = 100)



