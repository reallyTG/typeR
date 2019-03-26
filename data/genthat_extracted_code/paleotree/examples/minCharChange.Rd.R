library(paleotree)


### Name: minCharChange
### Title: Estimating the Minimum Number of Character Transitions Using
###   Maximum Parsimony
### Aliases: minCharChange ancPropStateMat ancPropStateMat

### ** Examples

## No test: 
# let's write a quick & dirty ancestral trait plotting function

quickAncPlotter <- function(tree,ancData,cex){
    ancCol <- (1:ncol(ancData))+1
        plot(tree,show.tip.label = FALSE,no.margin = TRUE,direction = "upwards")
        tiplabels(pch = 16,pie = ancData[(1:Ntip(tree)),],cex = cex,piecol = ancCol,
	    col = 0)
    nodelabels(pie = ancData[-(1:Ntip(tree)),],cex = cex,piecol = ancCol)	
    }

# example with retiolitid graptolite data

data(retiolitinae)

#unordered, MPR
ancMPR <- ancPropStateMat(retioTree, trait = retioChar[,2], type = "MPR")
quickAncPlotter(retioTree,ancMPR,cex = 0.5)
text(x = 4,y = 5,"type = 'MPR'",cex = 1.5)

minCharChange(retioTree,trait = retioChar[,2],type = "MPR")

# with simulated data

set.seed(444)
tree <- rtree(50)
#simulate under a likelihood model
char <- rTraitDisc(tree,k = 3,rate = 0.7)
tree$edge.length <- NULL
tree <- ladderize(tree)

#unordered, MPR
ancMPR <- ancPropStateMat(tree, trait = char, type = "MPR")
#ordered, MPR
ancMPRord <- ancPropStateMat(tree, trait = char, orderedChar = TRUE, type = "MPR")


#let's compare unordered versus ordered under MPR
layout(1:2)
quickAncPlotter(tree,ancMPR,cex = 0.3)
text(x = 8,y = 15,"unordered char\nMPR",cex = 1.5)
quickAncPlotter(tree,ancMPRord,cex = 0.3)
text(x = 9,y = 15,"ordered char\nMPR",cex = 1.5)
layout(1)

## Not run: 
##D # what ancPropStateMat automates (with lots of checks):
##D 
##D require(phangorn)
##D char1 <- matrix(char,,1)
##D rownames(char1) <- names(char)
##D #translate into something for phangorn to read
##D char1 <- phyDat(char1,type = "USER",levels = sort(unique(char1)))
##D x <- ancestral.pars(tree,char1,type = "MPR")
##D y <- ancestral.pars(tree,char1,type = "ACCTRAN")
## End(Not run)

#estimating minimum number of transitions with MPR 
minCharChange(tree,trait = char,type = "MPR")


#POLYMORPHISM IN CHARACTER DATA


# example trait data with a polymorphic taxon
     # separated with '&' symbol
# similar to polymorphic data output by ReadMorphNexus from package Claddis
charPoly <- as.character(c(1,2,NA,0,0,1,"1&2",2,0,NA,0,2,1,1,"1&2"))
#simulate a tree with 16 taxa
set.seed(444)
tree <- rtree(15)
tree$edge.length <- NULL
tree <- ladderize(tree)
names(charPoly) <- tree$tip.label
charPoly

# need a contrast matrix that takes this into account
    #can build row by row, by hand

#first, build contrast matrix for basic states
contrast012 <- rbind(c(1,0,0),c(0,1,0),c(0,0,1))
colnames(contrast012) <- rownames(contrast012) <- 0:2
contrast012

#add polymorphic state and NA ambiguity as new rows
contrastPoly <- c(0,1,1)
contrastNA <- c(1,1,1)
contrastNew <- rbind(contrast012,'1&2' = contrastPoly,contrastNA)
rownames(contrastNew)[5] <- NA

#let's look at contrast
contrastNew

# now try this contrast table we've assembled
    # default: unordered, MPR
ancPoly <- ancPropStateMat(tree, trait = charPoly, contrast = contrastNew)

# but...!
# we can also do it automatically, 
    # by default, states with '&' are automatically treated
    # as polymorphic character codings by ancPropStateMat
ancPolyAuto <- ancPropStateMat(tree, trait = charPoly, polySymbol = "&")

# but does this match what the table we constructed?
ancPropStateMat(tree, trait = charPoly,
		polySymbol = "&", returnContrast = TRUE)

# compare to contrastNew above!
# only difference should be the default ambiguous
	# character '?' is added to the table

#compare reconstructions
layout(1:2)
quickAncPlotter(tree,ancPoly,cex = 0.5)
text(x = 3.5,y = 1.2,"manually-constructed\ncontrast",cex = 1.3)
quickAncPlotter(tree,ancPolyAuto,cex = 0.5)
text(x = 3.5,y = 1.2,"auto-constructed\ncontrast",cex = 1.3)
layout(1)

#look pretty similar!

#i.e. the default polySymbol = "&", but could be a different symbol
     #such as "," or "\"... it can only be *one* symbol, though

# all of this machinery should function just fine in minCharChange
	# again, by default polySymbol = "&" (included anyway here for kicks)
minCharChange(tree, trait = charPoly, polySymbol = "&")
## End(No test)



