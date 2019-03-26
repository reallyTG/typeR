library(pcaPP)


### Name: cor.fk
### Title: Fast estimation of Kendall's tau rank correlation coefficient
### Aliases: cor.fk
### Keywords: multivariate robust

### ** Examples


  set.seed (100)		## creating test data
  n <- 1000
  x <- rnorm (n)
  y <- x+  rnorm (n)

  tim <- proc.time ()[1]	## applying cor.fk
  cor.fk (x, y)
  cat ("cor.fk runtime [s]:", proc.time ()[1] - tim, "(n =", length (x), ")\n")

  tim <- proc.time ()[1]	## applying cor (standard R implementation)
  cor (x, y, method = "kendall")
  cat ("cor runtime [s]:", proc.time ()[1] - tim, "(n =", length (x), ")\n")

		##	applying cor and cor.fk on data containing				

  Xt <- cbind (c (x, as.integer (x)), c (y, as.integer (y)))

  tim <- proc.time ()[1]	## applying cor.fk
  cor.fk (Xt)
  cat ("cor.fk runtime [s]:", proc.time ()[1] - tim, "(n =", nrow (Xt), ")\n")

  tim <- proc.time ()[1]	## applying cor (standard R implementation)
  cor (Xt, method = "kendall")
  cat ("cor runtime [s]:", proc.time ()[1] - tim, "(n =", nrow (Xt), ")\n")



