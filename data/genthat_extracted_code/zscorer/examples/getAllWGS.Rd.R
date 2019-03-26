library(zscorer)


### Name: getAllWGS
### Title: getAllWGS
### Aliases: getAllWGS

### ** Examples

  # apply \code{getAllWGS()} to a make believe 52 month old male child with weight of
  # 14.6 kg and height of 98.0 cm
  waz <- getAllWGS(sex = 1,          # 1 = Male / 2 = Female
                   weight = 14.6,    # Weight in kilograms
                   height = 98,      # Height in centimetres
                   age = 52,         # Age in whole months
                   index = "wfa")    # Anthropometric index (weight-for-age)
  waz

  haz <- getAllWGS(sex = 1,
                   weight = 14.6,
                   height = 98,      # Height in centimetres
                   age = 52,
                   index = "hfa")    # Anthropometric index (height-for-age)
  haz

  whz <- getAllWGS(sex = 1,
                   weight = 14.6,
                   height = 98,
                   age = 52,
                   index = "wfh")    # Anthropometric index (weight-for-height)
  whz

  # apply \code{getAllWGS()} to \code{anthro1} dataset
  waz <- getAllWGS(data = anthro1,
                   sex = "sex",
                   weight = "weight",
                   height = "height",
                   age = "age",
                   index = "wfa")
  waz

  haz <- getAllWGS(sex = anthro1$sex,
                   weight = anthro1$weight,
                   height = anthro1$height,
                   age = anthro1$age,
                   index = "hfa")
  haz

  all <- getAllWGS(data = anthro1,
                   sex = "sex",
                   weight = "weight",
                   height = "height",
                   age = "age",
                   index = "all")
  all




