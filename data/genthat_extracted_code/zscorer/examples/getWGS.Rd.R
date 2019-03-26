library(zscorer)


### Name: getWGS
### Title: getWGS
### Aliases: getWGS

### ** Examples

  # apply \code{getWGS()} to a make believe 52 month old male child with weight of
  # 14.6 kg and height of 98.0 cm
  waz <- getWGS(sexObserved = 1,     # 1 = Male / 2 = Female
                firstPart = 14.6,    # Weight in kilograms
                secondPart = 52,     # Age in whole months
                index = "wfa")       # Anthropometric index (weight-for-age)
  waz

  haz <- getWGS(sexObserved = 1,
                firstPart = 98,      # Height in centimetres
                secondPart = 52,
                index = "hfa")       # Anthropometric index (height-for-age)
  haz

  whz <- getWGS(sexObserved = 1,
                firstPart = 14.6,
                secondPart = 98,
                index = "wfh")       # Anthropometric index (weight-for-height)
  whz




