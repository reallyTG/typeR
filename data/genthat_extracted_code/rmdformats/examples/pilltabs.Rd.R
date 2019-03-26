library(rmdformats)


### Name: pilltabs
### Title: Given a cross-table, outputs HTML code to display several views
###   of with a tabbed interface
### Aliases: pilltabs

### ** Examples


data(airquality)
tab <- table(airquality$Month, airquality$Ozone > 25)
pilltabs(tab)




