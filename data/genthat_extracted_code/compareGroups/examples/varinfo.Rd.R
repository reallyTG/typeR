library(compareGroups)


### Name: varinfo
### Title: Variable names and labels extraction
### Aliases: varinfo varinfo.compareGroups varinfo.createTable
### Keywords: utilities

### ** Examples

require(compareGroups)
data(regicor)
res<-compareGroups(sex ~ . ,regicor)
#createTable(res, hide.no = 'no')  
varinfo(res)



