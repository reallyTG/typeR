library(numOSL)


### Name: analyseBINdata
### Title: BIN data analysis
### Aliases: analyseBINdata analyseBINdata.default
### Keywords: growth curve BIN file

### ** Examples

   ### Example 1 (not run):
   # obj_loadBIN <- loadBINdata("foo.bin", view=TRUE)
   # obj_pickBIN <- pickBINdata(obj_loadBIN, Position=2, LType="OSL")
   # analyseBINdata(obj_pickBIN, nfchn=3, nlchn=20)

   ### Example 2:
   data(BIN)
   obj_pickBIN <- pickBINdata(BIN, Position=c(2,4,6,8,10), 
                              LType="OSL", view=FALSE)
   obj_analyseBIN <- analyseBINdata(obj_pickBIN, nfchn=3, nlchn=20) 
   obj_analyseBIN$SARdata



