library(IncDTW)


### Name: idtw2vec
### Title: Incremental vector-based DTW
### Aliases: idtw2vec idtw2vec_cm idtw2vec_univ idtw2vec_multiv
### Keywords: classif cluster ts

### ** Examples

Q <- cumsum(rnorm(100))
C <- Q[11:100] + rnorm(90, 0, 0.5)

# initial calculation
res0 <- idtw2vec(Q=Q, newObs = C, gcm_lc = NULL)

# incremental calculation for new observations
res1 <- idtw2vec(Q, newObs = rnorm(10), gcm_lc = res0$gcm_lc_new)



# perform an incremental DTW calculation with a customized distance function 
d_cos <- function(x, y){
   sum(x * y)/(sqrt(sum(x^2)) * sqrt(sum(y^2))) 
}

x <- matrix(rnorm(100), ncol=5, nrow=20)
y <- matrix(rnorm(150), ncol=5, nrow=30)

cm1 <- function(x,y){
   nx <- nrow(x); ny <- nrow(y)
   mat <- matrix(0, ncol=ny, nrow=nx)
   for(i in 1:nx){
      for(j in 1:ny){
         mat[i,j] <- d_cos(x[i,], y[j, ])
      }
   }
   return(mat)
}

dtw2vec(Q = cm1(x,y), C = "cm")$distance
res0 <- idtw2vec(Q = cm1(x,y[1:20,]), newObs =  "cm")
idtw2vec(Q = cm1(x,y[21:30,]), newObs =  "cm", 
                 gcm_lc = res0$gcm_lc_new)$distance




