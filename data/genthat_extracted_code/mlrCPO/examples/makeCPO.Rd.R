library(mlrCPO)


### Name: makeCPO
### Title: Create a Custom CPO Constructor
### Aliases: makeCPO makeCPOExtendedTrafo makeCPORetrafoless
###   makeCPOTargetOp makeCPOExtendedTargetOp

### ** Examples

# an example constant feature remover CPO
constFeatRem = makeCPO("constFeatRem",
 dataformat = "df.features",
 cpo.train = function(data, target) {
   names(Filter(function(x) {  # names of columns to keep
       length(unique(x)) > 1
     }, data))
   }, cpo.retrafo = function(data, control) {
   data[control]
 })
# alternatively:
constFeatRem = makeCPO("constFeatRem",
  dataformat = "df.features",
  cpo.train = function(data, target) {
    cols.keep = names(Filter(function(x) {
        length(unique(x)) > 1
      }, data))
    # the following function will do both the trafo and retrafo
    result = function(data) {
      data[cols.keep]
    }
    result
  }, cpo.retrafo = NULL)



