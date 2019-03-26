library(GPArotation)


### Name: rotations
### Title: Rotations
### Aliases: rotations oblimin quartimin targetT targetQ pstT pstQ oblimax
###   entropy quartimax Varimax simplimax bentlerT bentlerQ tandemI
###   tandemII geominT geominQ cfT cfQ infomaxT infomaxQ mccammon bifactorT
###   bifactorQ vgQ.oblimin vgQ.quartimin vgQ.target vgQ.pst vgQ.oblimax
###   vgQ.entropy vgQ.quartimax vgQ.varimax vgQ.simplimax vgQ.bentler
###   vgQ.tandemI vgQ.tandemII vgQ.geomin vgQ.cf vgQ.infomax vgQ.mccammon
###   vgQ.bifactor
### Keywords: multivariate

### ** Examples

  data(ability.cov)
  factanal(factors = 2, covmat = ability.cov, rotation="oblimin")

  data("Harman", package="GPArotation")
  qHarman  <- GPForth(Harman8, Tmat=diag(2), method="quartimax")
  qHarman2 <- quartimax(Harman8) 

  data("WansbeekMeijer", package="GPArotation")
  fa.unrotated  <- factanal(factors = 2, covmat=NetherlandsTV, rotation="none")

  fa.varimax <- factanal(factors = 2, covmat=NetherlandsTV, 
                rotation="varimax", control=list(rotate=list(normalize=TRUE)))
  fa.oblimin <- factanal(factors = 2, covmat=NetherlandsTV,
                rotation="oblimin", control=list(rotate=list(normalize=TRUE)))
  
  cbind(loadings(fa.unrotated), loadings(fa.varimax), loadings(fa.oblimin))

  


