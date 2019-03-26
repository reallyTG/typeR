library(paleotree)


### Name: timePaleoPhy
### Title: Typical 'a posteriori' Time-Scaling Approaches For
###   Paleontological Phylogenies
### Aliases: timePaleoPhy bin_timePaleoPhy bin_timePaleoPhy

### ** Examples


# examples with empirical data

#load data
data(retiolitinae)

#Can plot the unscaled cladogram
plot(retioTree)
#Can plot discrete time interval diversity curve with retioRanges
taxicDivDisc(retioRanges)

#Use basic time-scaling (terminal branches only go to FADs)
ttree <- bin_timePaleoPhy(tree = retioTree,timeList = retioRanges,type = "basic",
	ntrees = 1, plot = TRUE)

#Use basic time-scaling (terminal branches go to LADs)
ttree <- bin_timePaleoPhy(tree = retioTree,timeList = retioRanges,type = "basic",
	add.term = TRUE, ntrees = 1, plot = TRUE)

#mininum branch length time-scaling (terminal branches only go to FADs)
ttree <- bin_timePaleoPhy(tree = retioTree,timeList = retioRanges,type = "mbl",
	vartime = 1, ntrees = 1, plot = TRUE)

###################

# examples with simulated data

#Simulate some fossil ranges with simFossilRecord
set.seed(444)
record <- simFossilRecord(p = 0.1, q = 0.1, nruns = 1,
nTotalTaxa = c(30,40), nExtant = 0)
taxa <- fossilRecord2fossilTaxa(record)
#simulate a fossil record with imperfect sampling with sampleRanges
rangesCont <- sampleRanges(taxa,r = 0.5)
#let's use taxa2cladogram to get the 'ideal' cladogram of the taxa
cladogram <- taxa2cladogram(taxa,plot = TRUE)
#Now let's try timePaleoPhy using the continuous range data
ttree <- timePaleoPhy(cladogram,rangesCont,type = "basic",plot = TRUE)
#plot diversity curve 
phyloDiv(ttree)

#that tree lacked the terminal parts of ranges (tips stops at the taxon FADs)
#let's add those terminal ranges back on with add.term
ttree <- timePaleoPhy(cladogram,rangesCont,type = "basic",add.term = TRUE,plot = TRUE)
#plot diversity curve 
phyloDiv(ttree)

#that tree didn't look very resolved, does it? (See Wagner and Erwin 1995 to see why)
#can randomly resolve trees using the argument randres
#each resulting tree will have polytomies randomly resolved in different ways using multi2di
ttree <- timePaleoPhy(cladogram,rangesCont,type = "basic",ntrees = 1,randres = TRUE,
    add.term = TRUE,plot = TRUE)
#notice well the warning it prints!
#we would need to set ntrees to a large number to get a fair sample of trees

#if we set ntrees>1, timePaleoPhy will make multiple time-trees
ttrees <- timePaleoPhy(cladogram,rangesCont,type = "basic",ntrees = 9,randres = TRUE,
    add.term = TRUE,plot = TRUE)
#let's compare nine of them at once in a plot
layout(matrix(1:9,3,3))
parOrig <- par(no.readonly = TRUE)
par(mar = c(1,1,1,1))
for(i in 1:9){plot(ladderize(ttrees[[i]]),show.tip.label = FALSE,no.margin = TRUE)}
#they are all a bit different!

#we can also resolve the polytomies in the tree according to time of first appearance
	#via the function timeLadderTree, by setting the argument 'timeres' to TRUE
ttree <- timePaleoPhy(cladogram,rangesCont,type = "basic",ntrees = 1,timeres = TRUE,
    add.term = TRUE,plot = TRUE)

#can plot the median diversity curve with multiDiv
layout(1);par(parOrig)
multiDiv(ttrees)

#compare different methods of timePaleoPhy
layout(matrix(1:6,3,2))
parOrig <- par(no.readonly = TRUE)
par(mar = c(3,2,1,2))
plot(ladderize(timePaleoPhy(cladogram,rangesCont,type = "basic",vartime = NULL,add.term = TRUE)))
    axisPhylo();text(x = 50,y = 23,"type = basic",adj = c(0,0.5),cex = 1.2)
plot(ladderize(timePaleoPhy(cladogram,rangesCont,type = "equal",vartime = 10,add.term = TRUE)))
    axisPhylo();text(x = 55,y = 23,"type = equal",adj = c(0,0.5),cex = 1.2)
plot(ladderize(timePaleoPhy(cladogram,rangesCont,type = "aba",vartime = 1,add.term = TRUE)))
    axisPhylo();text(x = 55,y = 23,"type = aba",adj = c(0,0.5),cex = 1.2)
plot(ladderize(timePaleoPhy(cladogram,rangesCont,type = "zlba",vartime = 1,add.term = TRUE)))
    axisPhylo();text(x = 55,y = 23,"type = zlba",adj = c(0,0.5),cex = 1.2)
plot(ladderize(timePaleoPhy(cladogram,rangesCont,type = "mbl",vartime = 1,add.term = TRUE)))
    axisPhylo();text(x = 55,y = 23,"type = mbl",adj = c(0,0.5),cex = 1.2)
layout(1);par(parOrig)

#using node.mins
#let's say we have (molecular??) evidence that node #5 is at least 1200 time-units ago
#to use node.mins, first need to drop any unshared taxa
droppers <- cladogram$tip.label[is.na(
      match(cladogram$tip.label,names(which(!is.na(rangesCont[,1])))))]
cladoDrop <- drop.tip(cladogram, droppers)
# now make vector same length as number of nodes
nodeDates <- rep(NA, Nnode(cladoDrop))
nodeDates[5] <- 1200
ttree1 <- timePaleoPhy(cladoDrop,rangesCont,type = "basic",
  	randres = FALSE,node.mins = nodeDates,plot = TRUE)
ttree2 <- timePaleoPhy(cladoDrop,rangesCont,type = "basic",
   	randres = TRUE,node.mins = nodeDates,plot = TRUE)

#Using bin_timePaleoPhy to time-scale with discrete interval data
#first let's use binTimeData() to bin in intervals of 1 time unit
rangesDisc <- binTimeData(rangesCont,int.length = 1)
ttreeB1 <- bin_timePaleoPhy(cladogram,rangesDisc,type = "basic",ntrees = 1,randres = TRUE,
    add.term = TRUE,plot = FALSE)
#notice the warning it prints!
phyloDiv(ttreeB1)
#with time-order resolving via timeLadderTree
ttreeB2 <- bin_timePaleoPhy(cladogram,rangesDisc,type = "basic",ntrees = 1,timeres = TRUE,
    add.term = TRUE,plot = FALSE)
phyloDiv(ttreeB2)
#can also force the appearance timings not to be chosen stochastically
ttreeB3 <- bin_timePaleoPhy(cladogram,rangesDisc,type = "basic",ntrees = 1,
    nonstoch.bin = TRUE,randres = TRUE,add.term = TRUE,plot = FALSE)
phyloDiv(ttreeB3)

# testing node.mins in bin_timePaleoPhy
ttree <- bin_timePaleoPhy(cladoDrop,rangesDisc,type = "basic",ntrees = 1,
    add.term = TRUE,randres = FALSE,node.mins = nodeDates,plot = TRUE)
# with randres = TRUE
ttree <- bin_timePaleoPhy(cladoDrop,rangesDisc,type = "basic",ntrees = 1,
    add.term = TRUE,randres = TRUE,node.mins = nodeDates,plot = TRUE)

## No test: 
#simple three taxon example for testing inc.term.adj
ranges1 <- cbind(c(3,4,5),c(2,3,1));rownames(ranges1) <- paste("t",1:3,sep = "")
clado1 <- read.tree(file = NA,text = "(t1,(t2,t3));")
ttree1 <- timePaleoPhy(clado1,ranges1,type = "mbl",vartime = 1)
ttree2 <- timePaleoPhy(clado1,ranges1,type = "mbl",vartime = 1,add.term = TRUE)
ttree3 <- timePaleoPhy(clado1,ranges1,type = "mbl",vartime = 1,add.term = TRUE,inc.term.adj = TRUE)
layout(1:3)
ttree1$root.time;plot(ttree1);axisPhylo()
ttree2$root.time;plot(ttree2);axisPhylo()
ttree3$root.time;plot(ttree3);axisPhylo()
-apply(ranges1,1,diff)
## End(No test)




