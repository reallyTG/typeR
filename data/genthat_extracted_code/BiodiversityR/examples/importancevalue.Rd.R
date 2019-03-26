library(BiodiversityR)


### Name: importancevalue
### Title: Importance Value
### Aliases: importancevalue importancevalue.comp
### Keywords: multivariate

### ** Examples

data(ifri)
importancevalue(ifri, site='plotID', species='species', count='count', 
    basal='basal', factor='forest', level='YSF')
importancevalue.comp(ifri, site='plotID', species='species', count='count', 
    basal='basal', factor='forest')

# When all survey plots are the same size, importance value
# is not affected. Counts and basal areas now calculated per square metre
ifri$count <- ifri$count/314.16
ifri$basal <- ifri$basal/314.16

importancevalue(ifri, site='plotID', species='species', count='count', 
    basal='basal', factor='forest', level='YSF')
importancevalue.comp(ifri, site='plotID', species='species', count='count', 
    basal='basal', factor='forest')




