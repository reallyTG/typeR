library(paleotree)


### Name: graptDisparity
### Title: Morphlogical Character and Range Data for late Ordovician and
###   Early Silurian Graptoloidea
### Aliases: graptDisparity graptCharMatrix graptRanges graptDistMat
### Keywords: datasets

### ** Examples


#load data
data(graptDisparity)

#separate out two components of character matrix

#45 discrete characters
discChar <- graptCharMatrix[,1:45]

#min ranges for 4 continuous characters
cMinChar <- graptCharMatrix[,c(46,48,50,52)]
#max ranges for 4 continuous characters
cMaxChar <- graptCharMatrix[,c(47,49,51,53)]

#group (clade/paraclade) coding
groupID <- graptCharMatrix[,54]

#number of species
nspec <- nrow(graptCharMatrix)

#some plotting information from Bapst et al.'s plotting scripts
grpLabel <- c("Normalo.","Monogr.","Climaco.",
		"Dicrano.","Lasiogr.","Diplogr.","Retiol.")
grpColor <- c("red","purple",colors()[257],colors()[614],
		colors()[124],"blue",colors()[556])

##########

#plot diversity curve of taxa
taxicDivDisc(graptRanges)

#but the actual study interval for the data is much smaller
abline(v = 448.57,lwd = 3) #start of study interval
abline(v = 439.37,lwd = 3) #end of study interval

#plot diversity curve just for study interval
taxicDivDisc(graptRanges, timelims = c(448.57,439.37))

############

#distance matrix is given as graptDistMat
   #to calculate yourself, see code below in DoNotRun section

#now, is the diagonal zero? (it should be)
all(diag(graptDistMat) == 0)

#now, is the matrix symmetric? (it should be)
isSymmetric(graptDistMat)

#can apply cluster analysis
clustRes <- hclust(as.dist(graptDistMat))
plot(clustRes,labels = FALSE)

#use ape to plot with colors at the tips
dev.new(width = 15) 	# for a prettier plot
plot.phylo(as.phylo(clustRes),show.tip.label = FALSE,
		no.margin = TRUE,direction = "upwards")
tiplabels(pch = 16,col = grpColor[groupID+1])
legend("bottomright",legend = grpLabel,col = grpColor,pch = 16)
dev.set(2)

#can apply PCO (use lingoes correction to account for negative values
   #resulting from non-euclidean matrix
pco_res <- pcoa(graptDistMat,correction = "lingoes")

#relative corrected eigenvalues
rel_corr_eig <- pco_res$values$Rel_corr_eig
layout(1:2)
plot(rel_corr_eig)
#cumulative
plot(cumsum(rel_corr_eig))

#first few axes account for very little variance!!



#well let's look at those PCO axes anyway
layout(1)
pco_axes <- pco_res$vectors
plot(pco_axes[,1],pco_axes[,2],pch = 16,col = grpColor[groupID+1],
   xlab = paste("PCO Axis 1, Rel. Corr. Eigenvalue  = ",round(rel_corr_eig[1],3)),
   ylab = paste("PCO Axis 2, Rel. Corr. Eigenvalue  = ",round(rel_corr_eig[2],3)))
legend("bottomright",legend = grpLabel,col = grpColor,pch = 16,ncol = 2,cex = 0.8)


##########m##############

## Not run: 
##D  
##D 
##D #calculate a distance matrix (very slow!)
##D #Bapst et al. calculated as # char diffs / total # of chars
##D    #but both calculated for only non-missing characters for both taxa
##D #non-identical discrete states = difference for discrete traits
##D #non-overlapping ranges for continuous characters = difference for cont traits
##D 
##D distMat <- matrix(,nspec,nspec)
##D rownames(distMat) <- colnames(distMat) <- rownames(graptCharMatrix)
##D for(i in 1:nspec){ for(j in 1:nspec){    #calculate for each pair of species
##D    #discrete characters
##D    di <- discChar[i,]     #discrete character vector for species i
##D    dj <- discChar[j,]     #discrete character vector for species j
##D    #now calculate pair-wise differences for non-missing characters
##D    discDiff <- (di != dj)[!is.na(di)&!is.na(dj)] #logical vector
##D    #
##D    #continuous characters: need another for() loop
##D    contDiff <- numeric()
##D    for(ct in 1:4){
##D        #if they do not overlap, a min must be greater than a max value
##D        contDiff[ct] <- cMinChar[i,ct]>cMaxChar[j,ct] | cMinChar[j,ct]>cMaxChar[i,ct]
##D        }
##D    #remove NAs
##D    contDiff <- contDiff[!is.na(contDiff)]
##D    #combine
##D    totalDiff <- c(discDiff,contDiff)
##D    #divide total difference 
##D    distMat[i,j] <- sum(totalDiff)/length(totalDiff)
##D    }}
##D 
##D #but is it identical to the distance matrix already provided?
##D identical(distMat,graptDistMat)
##D #ehh, numerical rounding issues...
##D 
##D #A somewhat speeder alternative to calculate a distance matrix
##D distMat <- matrix(,nspec,nspec)
##D rownames(distMat) <- colnames(distMat) <- rownames(graptCharMatrix)
##D for(i in 1:(nspec-1)){ for(j in (i+1):nspec){    #calculate for each pair of species
##D    #now calculate pair-wise differences for non-missing characters
##D    discDiff <- (discChar[i,] != discChar[j,])[
##D       !is.na(discChar[i,])&!is.na(discChar[j,])] #logical vector
##D    #continuous characters: if they do not overlap, a min must be greater than a max value
##D       contDiff <- sapply(1:4,function(ct)
##D             cMinChar[i,ct]>cMaxChar[j,ct] | cMinChar[j,ct]>cMaxChar[i,ct])
##D    #remove NAs, combine, divide total difference 
##D    distMat[i,j] <- distMat[j,i] <- sum(c(discDiff,contDiff[!is.na(contDiff)]))/length(
##D         c(discDiff,contDiff[!is.na(contDiff)]))
##D    }}
##D diag(distMat) <- 0
##D 
##D #but is it identical to the distance matrix already provided?
##D identical(distMat,graptDistMat)
##D #ehh, MORE numerical rounding issues...
##D 
## End(Not run)




