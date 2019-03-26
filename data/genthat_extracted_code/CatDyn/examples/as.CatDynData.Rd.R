library(CatDyn)


### Name: as.CatDynData
### Title: Data Object for the Estimation of Catch Dynamic Models
### Aliases: as.CatDynData
### Keywords: ~manip

### ** Examples

lgahi <- as.CatDynData(x=lolgahi,
                       step="day",
                       fleet.name="Fk",
                       coleff=2,
                       colcat=1,
                       colmbw=3,
                       unitseff="nboats",
                       unitscat="kg",
                       unitsmbw="kg",
                       nmult="bill",
                       season.dates=c(as.Date("1990-01-31"),
                                      as.Date("1990-05-30")))



