library(forestmangr)


### Name: diameter_class
### Title: Divide data into diameter classes, and get number of
###   observations
### Aliases: diameter_class

### ** Examples

library(forestmangr)
data("exfm20")
exfm20

# n
# Number of individuals per ha per diameter class
diameter_class(df = exfm20, dbh = "dbh", ci = 10, dbhmin = 10, volume = "vol") 

# Number of individuals per ha per diameter class per species
diameter_class(exfm20,"dbh", "transect", 10000, 10, 10, "scientific.name") 

# Number of individuals per ha per diameter class, with each diameter class as a column
diameter_class(exfm20,"dbh", "transect", 10000, 10, 10, "scientific.name", cc_to_column=TRUE) 

# G
# Basal area per ha per diameter class, with each diameter class as a column
diameter_class(exfm20,"dbh", "transect",10000,10,10,"scientific.name",
cc_to_column=TRUE,G_to_cc=FALSE) 


# Volume
# Volume per ha per diameter class
diameter_class(exfm20,"dbh", "transect", 10000, 10, 10, "scientific.name",volume = "vol") 

# Volume per ha per diameter class, with each diameter class as a column
diameter_class(exfm20,"dbh","transect",10000,10,10,"scientific.name","vol",cc_to_column=TRUE) 




