library(simrel)


### Name: mbrdsim
### Title: A function to set up a design for a given set of factors with
###   their specific levels using the MBR-design method.
### Aliases: mbrdsim
### Keywords: MBRD Design

### ** Examples

#Input: A list of factors with their levels (number of levels must be a multiple of 2).
simlist <- list(R2=c(0.5,0.9), 
                pos = c(12,45),
                gamma = c(0.1, 0.9),
                comp = 1:8,
                alpha = c(0.01, 0.05, 0.1, 0.25))

# A 1/8 design
des <- mbrdsim(simlist, fraction=3)
#The MBRD-design at original factor level
des$Design
#Info about the bit-design
design.info(des$BitDesign)



