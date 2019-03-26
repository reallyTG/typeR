library(numOSL)


### Name: lsNORM
### Title: Regenerative-dose signal optimization using the LS-normalisation
###   procedure
### Aliases: lsNORM lsNORM.default
### Keywords: growth curve LS-normalisation

### ** Examples

  ### Example 1:
  data(SARdata)
  # Use only the first five aliquots of SARdata.
  Data <- SARdata[1:40,]
  res_lsNORM <- lsNORM(Data, model="gok")
  res_lsNORM$norm.SARdata

  ### Example 2 (not run):
  # data(BIN)
  # obj_pickBIN <- pickBINdata(BIN, Position=1:48, Grain=0,
  #                            LType="OSL", view=FALSE)
  # obj_analyseBIN <- analyseBINdata(obj_pickBIN, nfchn=3, nlchn=20)
  # lsNORM(obj_analyseBIN$SARdata, norm.dose=300)
  
  



