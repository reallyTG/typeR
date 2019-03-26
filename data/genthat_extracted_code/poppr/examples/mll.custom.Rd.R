library(poppr)


### Name: mll.custom
### Title: Define custom multilocus lineages
### Aliases: mll.custom mll.custom,genclone-method
###   mll.custom,snpclone-method mll.custom<- mll.custom<-,genclone-method
###   mll.custom<-,snpclone-method mll.levels mll.levels,genclone-method
###   mll.levels,snpclone-method mll.levels<- mll.levels<-,genclone-method
###   mll.levels<-,snpclone-method

### ** Examples

data(partial_clone)
pc <- as.genclone(partial_clone)
mll.custom(pc) <- LETTERS[mll(pc)]
mll(pc)

# Let's say we had a mistake and the A mlg was actually B. 
mll.levels(pc)[mll.levels(pc) == "A"] <- "B"
mll(pc)

# Set the MLL back to the original definition.
mll(pc) <- "original"
mll(pc)



