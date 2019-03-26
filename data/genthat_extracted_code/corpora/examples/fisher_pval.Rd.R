library(corpora)


### Name: fisher.pval
### Title: P-values of Fisher's exact test for frequency comparisons
###   (corpora)
### Aliases: fisher.pval
### Keywords: htest

### ** Examples


  ## Fisher's Tea Drinker (see ?fisher.test)
  TeaTasting <-
  matrix(c(3, 1, 1, 3),
         nrow = 2,
         dimnames = list(Guess = c("Milk", "Tea"),
                         Truth = c("Milk", "Tea")))
  print(TeaTasting)
  ##  - the "corpora" consist of 4 cups of tea each (n1 = n2 = 4)
  ##     => columns of TeaTasting
  ##  - frequency counts are the number of cups selected by drinker (k1 = 3, k2 = 1)
  ##     => first row of TeaTasting
  ##  - null hypothesis of equal type probability = drinker makes random guesses
  fisher.pval(3, 4, 1, 4, alternative="greater")
  fisher.test(TeaTasting, alternative="greater")$p.value # should be the same
  
  fisher.pval(3, 4, 1, 4) # uses fast approximation suitable for small p-values
  fisher.test(TeaTasting)$p.value # approximation is exact for symmetric distribution




