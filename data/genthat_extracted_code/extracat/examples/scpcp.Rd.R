library(extracat)


### Name: scpcp
### Title: Static Categorical Parallel Coordinates Plot
### Aliases: scpcp

### ** Examples


data(Titanic)
titanic <- as.data.frame(Titanic)

scpcp(titanic)

#scpcp(titanic, level.width=0)

#scpcp(titanic, gap=0)

#default with highlighting
scpcp(titanic, sel="data[,4]")

# random colors like for instance from a clustering
scpcp(titanic, sel="sample(1:6,nrow(data),T)")

# another one with some formal changes
require(scales)
scpcp(data=titanic,sel="Sex=='Male' & Survived=='Yes'", sel.palette = "w",
 col.opt=list(alpha=0.7,border=alpha(1,0.3)), gap = 0.5, level.width= 0.3)

## Not run: 
##D 
##D # mushroom data from the UCI machine learning repository
##D data(agaricus)
##D MR <- agaricus
##D 
##D levels(MR$stalk_root) <- c(levels(MR$stalk_root),"N/A")
##D MR$stalk_root[which(is.na(MR$stalk_root))] <- "N/A"
##D 
##D op <- optile(MR[,1:12], method="joint")
##D 
##D 
##D scpcp(op, sel = "odor",sel.palette="w",
##D 	 col.opt = list(border = alpha(1,0.1)), lab.opt=list(rot=45))
##D 
##D 
##D # ADAC ecotest data with four clusterings (k-means, mclust, hc Ward, hc complete)
##D data(eco)
##D 
##D # illustrate reordering success using coloring
##D scpcp(eco[,13:16], sel = "data[,1]", sel.palette="d")
##D 
##D scpcp(optile(eco[,13:16]), sel = "data[,1]", sel.palette="d",
##D 	 col.opt = list(border=alpha(1,0.1)))
##D 
##D # car classes (lower to upper class)
##D eco$Klasse <- factor(eco$Klasse, levels = levels(eco$Klasse)[c(3,1,2,7,4,5,6)])
##D 
##D scpcp(eco[,17:20], sel = eco$Klasse, sel.palette="s", col.opt = list(h=140))
##D 
##D # the color variable included
##D scpcp(eco[,c(3,17:20)], sel = eco$Klasse, sel.palette="s", 
##D 	col.opt = list(h=140),lab.opt = list(abbr=5))
## End(Not run)



