library(TKF)


### Name: PAMn
### Title: PAM and Dayhoff matrices calculation
### Aliases: PAMn Dayhoffn
### Keywords: ~kwd1 ~kwd2

### ** Examples

  data(GONNET)
  data(GONNETBF)
  ## PAM 250 mutation matrix
  PAM250 <- PAMn(GONNET, 250)
  
  ## Dayhoff 250 matrix
  Dayhoff250 <- Dayhoffn(GONNET, GONNETBF, 250)
  



