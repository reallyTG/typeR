library(labdsv)


### Name: dropplt
### Title: Dropping Plots with Missing Values From Taxon and Site Data
###   Frames
### Aliases: dropplt
### Keywords: manip

### ** Examples

    data(bryceveg)  # returns a data frame called bryceveg
    data(brycesite) # returns a data frame called brycesite
    demo <- dropplt(bryceveg,brycesite)
    newveg <- demo$taxa
    newsite <- demo$site



