library(qualV)


### Name: quantV
### Title: Quantitative Validation Methods
### Aliases: generalME MAE MAPE MSE RMSE CMAE CMSE RCMSE SMAE SMSE RSMSE
###   MALE MSLE MAGE RMSLE RMSGE SMALE SMAGE SMSLE RSMSLE RSMSGE MAOE MSOE
###   RMSOE
### Keywords: misc

### ** Examples

data(phyto)
obsb <- na.omit(obs[match(sim$t, obs$t), ])
simb <- sim[na.omit(match(obs$t, sim$t)), ]
o <- obsb$y
p <- simb$y

generalME(o, p, ignore = "raw", geometry = "real")

   MAE(o, p)
  MAPE(o, p)
   MSE(o, p)
  RMSE(o, p)
  CMAE(o, p)
  CMSE(o, p)
 RCMSE(o, p)
  SMAE(o, p)
  SMSE(o, p)
 RSMSE(o, p)
  MALE(o, p)
  MAGE(o, p)
 RMSLE(o, p)
 RMSGE(o, p)

 SMALE(o, p)
 SMAGE(o, p)
 SMSLE(o, p)

RSMSLE(o, p)
RSMSGE(o, p)

  MAOE(o, p)
  MSOE(o, p)
 RMSOE(o, p)
   MAE(o, p)
  MAPE(o, p)


   MSE(o, p, type = "s")
  RMSE(o, p, type = "s")
  CMAE(o, p, type = "s")
  CMSE(o, p, type = "s")
 RCMSE(o, p, type = "s")
  SMAE(o, p, type = "s")
  SMSE(o, p, type = "s")
 RSMSE(o, p, type = "s")
  MALE(o, p, type = "s")
  MAGE(o, p, type = "s")
 RMSLE(o, p, type = "s")
 RMSGE(o, p, type = "s")

 SMALE(o, p, type = "s")
 SMAGE(o, p, type = "s")
 SMSLE(o, p, type = "s")

RSMSLE(o, p, type = "s")
RSMSGE(o, p, type = "s")

  MAOE(o, p, type = "s")
  MSOE(o, p, type = "s")
 RMSOE(o, p, type = "s")



