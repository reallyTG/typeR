library(gambin)


### Name: mult_abundances
### Title: Fit a unimodal gambin model to multiple species abundance
###   distributions
### Aliases: mult_abundances

### ** Examples

#simulate a matrix containing the SAD data for 10 sites (50 sp. in each)
mult <- matrix(0, nrow = 50, ncol = 10)
mult <- apply(mult, 2, function(x) ceiling(rlnorm(length(x), 0, 2.5)))

#run the mult_abundances function and view the alpha values
mm <- mult_abundances(mult, N = 10, subsample = NULL)
mm[1:2]
plot(mm$Mean.Stan.Alpha, mm$Unstan.Alpha)

#simulate a list containing the SAD of 5 sites (with varying numbers of sp.)
mult2 <- vector("list", length = 5)
for (i in 1:ncol(mult)){
 dum <- sample(mult[, i], replace = TRUE)
 rm <- round(runif(1, 0, 5), 0)
 if (rm > 0){
   rm2 <- sample(1:length(dum), rm, replace = FALSE)
   dum <- dum[-rm2]
 }
 mult2[[i]] <- dum
}

#run the mult_abundances function on the list
mm2 <- mult_abundances(mult2, N = 5, subsample = NULL)
mm2[1:2] 



